import 'package:e_commerce_app/features/cart_view/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/product_view_widgets/product_view_amount_row.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/product_view_widgets/product_view_expansion_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';
import '../../../../../cart_view/presentation/manager/cart_cubit/cart_state.dart';
import '../../../../data/models/products/result.dart';
import 'product_view_price_text.dart';
import 'product_view_rate_text.dart';

class ProductViewBody extends StatelessWidget {
  final Result product;

  const ProductViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.sp),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* Product Name
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.symmetric(vertical: 16.sp),
              child: Text(
                product.name ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ),
            //* Product Price and rate
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceTextProductView(price: product.price),
                const Spacer(),
                RateTextProductView(rate: product.rate),
              ],
            ),
            //* Product Description
            Divider(thickness: 1.5.sp),
            ExpansionTextProductView(
                title: locale.theDescription, content: product.description),
            Divider(thickness: 1.5.sp),
            //* Product Amount And Total Salary
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              child: AmountRowProductView(price: product.price!),
            ),
            //* Add To Cart Button
            Padding(
              padding: EdgeInsets.only(top: 12.sp),
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  product.amount = getProductsCubit(context).amount;
                  return ElevatedBttnCustom(
                    title: locale.addToCart,
                    onTap: () => getCartCubit(context)
                        .addProductToCart(product: product),
                    isLoading: (state is CartLoadingSate) ? true : false,
                    width: 0.5.sw,
                    iconData: Icons.add_shopping_cart,
                  );
                },
              ),
            ),
            SizedBox(height: 0.1.sh)
          ],
        ),
      ),
    );
  }
}

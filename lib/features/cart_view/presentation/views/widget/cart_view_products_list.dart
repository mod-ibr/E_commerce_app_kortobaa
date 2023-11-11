import 'package:e_commerce_app/features/cart_view/presentation/views/widget/cart_view_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import 'cart_view_coupon_card.dart';

class ProductsListCartView extends StatelessWidget {
  const ProductsListCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubitProvider = getCartCubit(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: cartCubitProvider.allProductsFromCart!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ProductItemCartView(
                product: cartCubitProvider.allProductsFromCart![index]),
            (index + 1 == cartCubitProvider.allProductsFromCart!.length)
                ? const CouponCardCartView()
                : const SizedBox.shrink()
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16.sp),
    );
  }
}

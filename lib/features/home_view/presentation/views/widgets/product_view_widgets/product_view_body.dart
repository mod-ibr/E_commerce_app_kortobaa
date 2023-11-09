import 'package:e_commerce_app/features/home_view/presentation/views/widgets/product_view_widgets/product_view_amount_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../../data/models/products/result.dart';
import 'product_view_price_text.dart';
import 'product_view_rate_text.dart';

class ProductViewBody extends StatelessWidget {
  final Result product;

  const ProductViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.sp),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Product Name
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.sp),
              child: Text(
                product.name ?? "",
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
            //* Product Amount And Total Salary
            AmountRowProductView(price: product.price!)
          ],
        ),
      ),
    );
  }
}

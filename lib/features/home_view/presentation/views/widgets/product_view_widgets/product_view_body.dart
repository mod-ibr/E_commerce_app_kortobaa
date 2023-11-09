import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/product_view_widgets/product_view_amount_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../../data/models/products/result.dart';

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
                priceText(price: product.price, context: context),
                const Spacer(),
                rateText(rate: product.rate, context: context),
              ],
            ),
            //* Product Amount And Total Salary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: AmountRowProductView()),
                SizedBox(width: 8.sp),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: 12.sp, horizontal: 12.sp),
                    color: theme.colorScheme.tertiary,
                    child: priceText(
                        price: product.price,
                        context: context,
                        isColored: true),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget priceText(
      {required String? price,
      required BuildContext context,
      bool isColored = false}) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    int amount = getProductsCubit(context).amount;
    return price != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                !isColored ? price : (double.parse(price) * amount).toString(),
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: !isColored ? theme.colorScheme.secondary : null),
              ),
              SizedBox(width: 6.sp),
              Text(
                locale.egp,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: !isColored ? theme.colorScheme.secondary : null),
              ),
            ],
          )
        : const SizedBox.shrink();
  }

  Widget rateText({required String? rate, required BuildContext context}) {
    final theme = Theme.of(context);
    return rate != null
        ? Row(
            children: [
              Text(
                rate,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 8.sp),
              Icon(
                Icons.star,
                color: theme.colorScheme.tertiaryContainer,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

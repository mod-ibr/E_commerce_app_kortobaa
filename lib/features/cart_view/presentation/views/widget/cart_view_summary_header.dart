import 'package:e_commerce_app/features/cart_view/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/l10n.dart';

class SummaryHeaderCartView extends StatelessWidget {
  const SummaryHeaderCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubitProvider = getCartCubit(context);
    final theme = Theme.of(context);
    final locale = getL10n(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 9.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.sp),
          ),
          color: theme.colorScheme.tertiary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "(${cartCubitProvider.allProductsFromCart!.length})",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 6.sp),
              Text(
                locale.item,
                style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        theme.colorScheme.onTertiaryContainer.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Text(
                locale.total,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 6.sp),
              Text(
                cartCubitProvider.getTotalPrice().toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        theme.colorScheme.onTertiaryContainer.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 6.sp),
              Text(
                locale.egp,
                style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        theme.colorScheme.onTertiaryContainer.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

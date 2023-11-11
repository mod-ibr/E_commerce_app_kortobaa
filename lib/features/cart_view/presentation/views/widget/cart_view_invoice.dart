import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class InvoiceCartView extends StatelessWidget {
  const InvoiceCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubitProvider = getCartCubit(context);

    final locale = getL10n(context);
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.tertiary,
      padding:
          EdgeInsetsDirectional.symmetric(vertical: 9.sp, horizontal: 11.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                locale.total,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${cartCubitProvider.getTotalPrice().toString()} ${locale.egp}",
                style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        theme.colorScheme.onTertiaryContainer.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                locale.taxes,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "5.00 ${locale.egp}",
                style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        theme.colorScheme.onTertiaryContainer.withOpacity(0.6),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

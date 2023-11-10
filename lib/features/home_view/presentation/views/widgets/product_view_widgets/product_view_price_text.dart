import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../manager/products cubit/products_cubit.dart';

class PriceTextProductView extends StatelessWidget {
  final String? price;
  final bool isColored;

  const PriceTextProductView({super.key, required this.price, this.isColored = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    int amount = getProductsCubit(context).amount;

    return price != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                !isColored ? price! : (double.parse(price!) * amount).toString(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: !isColored ? theme.colorScheme.secondary : null,
                ),
              ),
              SizedBox(width: 6.sp),
              Text(
                locale.egp,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: !isColored ? theme.colorScheme.secondary : null,
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

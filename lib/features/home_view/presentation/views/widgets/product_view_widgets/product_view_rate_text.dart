import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateTextProductView extends StatelessWidget {
  final String? rate;

  const RateTextProductView({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return rate != null
        ? Row(
            children: [
              Text(
                rate!,
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

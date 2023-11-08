import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InlineErrorWidgetCustom extends StatelessWidget {
  final String message;
  const InlineErrorWidgetCustom({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.miscellaneous_services_rounded,
                size: 0.1.sw,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 24.sp),
              Text(
                message,
                style: theme.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

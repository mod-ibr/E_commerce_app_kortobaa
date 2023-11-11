import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedBttnCustom extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final double elevation;
  final Function onTap;
  final double? height;
  final double? width;
  final bool isLoading;
  final IconData? iconData;
  final double? fontSize;

  const ElevatedBttnCustom({
    super.key,
    required this.title,
    this.backgroundColor,
    this.elevation = 2,
    required this.onTap,
    this.height,
    this.width,
    this.isLoading = false,
    this.iconData,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: IgnorePointer(
        ignoring: isLoading,
        child: ElevatedButton(
          onPressed: () async {
            await onTap();
          },
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: backgroundColor ?? theme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: isLoading
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.tertiary,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (iconData != null)
                          ? Icon(iconData, color: theme.colorScheme.tertiary)
                          : const SizedBox.shrink(),
                      (iconData != null)
                          ? SizedBox(width: 12.sp)
                          : const SizedBox.shrink(),
                      Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: (backgroundColor != null)
                                ? theme.colorScheme.onTertiary
                                : theme.colorScheme.tertiary),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

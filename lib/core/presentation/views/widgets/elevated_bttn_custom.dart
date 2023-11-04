import 'package:flutter/material.dart';

class ElevatedBttnCustom extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final double elevation;
  final Function onTap;
  final double? height;
  final double? width;
  final bool isLoading;

  const ElevatedBttnCustom({
    super.key,
    required this.title,
    this.backgroundColor,
    this.elevation = 2,
    required this.onTap,
    this.height,
    this.width,
    this.isLoading = false,
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
            backgroundColor: theme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
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
                : Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.tertiary),
                  ),
          ),
        ),
      ),
    );
  }
}

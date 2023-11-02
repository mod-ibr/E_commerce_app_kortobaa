import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';

import '../../../localization/l10n.dart';
import '../../../utils/functions/toast_message.dart';
import '../../../utils/service_locater/service_locater.dart' as di;

class ElevatedBttnCustom extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final bool isFilled;
  final Color? borderColor;
  final double elevation;
  final Function onTap;
  final double? height;
  final double? width;
  final bool isLoading;

  const ElevatedBttnCustom({
    super.key,
    required this.title,
    this.backgroundColor,
    this.isFilled = true,
    this.borderColor,
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
            await _onPressed(context);
          },
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: isFilled
                ? backgroundColor ?? theme.colorScheme.primary
                : theme.colorScheme.tertiary,
            foregroundColor:
                isFilled ? theme.colorScheme.tertiary : backgroundColor,
            side: !isFilled
                ? BorderSide(color: borderColor ?? theme.colorScheme.onTertiary)
                : BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: isLoading
                ? CircularProgressIndicator(
                    color: isFilled
                        ? theme.colorScheme.tertiary
                        : theme.colorScheme.onTertiary,
                    strokeWidth: 2,
                  )
                : Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isFilled
                          ? borderColor ?? theme.colorScheme.tertiary
                          : borderColor ?? theme.colorScheme.onTertiary,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final locale = getL10n(context);
    if (await di.sl<ConnectivityWrapper>().isConnected) {
      onTap();
    } else {
      showShortToast(locale.notConnectedToInternet);
    }
  }
}
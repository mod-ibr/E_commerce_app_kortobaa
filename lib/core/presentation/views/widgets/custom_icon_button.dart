import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final Color? color;
  final bool? isRounded;

  const IconButtonCustom({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.color,
    this.isRounded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Ink(
      decoration: ShapeDecoration(
        color: (color != null) ? color : theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: (isRounded != null)
              ? BorderRadiusDirectional.only(
                  topStart: isRounded! ? Radius.zero : const Radius.circular(8),
                  bottomStart:
                      isRounded! ? Radius.zero : const Radius.circular(8),
                  bottomEnd:
                      !isRounded! ? Radius.zero : const Radius.circular(8),
                  topEnd: !isRounded! ? Radius.zero : const Radius.circular(8),
                )
              : BorderRadius.zero,
        ),
      ),
      child: IconButton(
        icon: Icon(iconData),
        color: theme.colorScheme.tertiary,
        onPressed: () => onPressed(),
      ),
    );
  }
}

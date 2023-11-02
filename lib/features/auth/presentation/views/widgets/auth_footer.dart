import 'package:flutter/material.dart';

class FooterAuth extends StatelessWidget {
  final String title, bttnTitle;
  final Function onTap;
  const FooterAuth(
      {super.key,
      required this.title,
      required this.bttnTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400, color: theme.colorScheme.onTertiary),
        ),
        GestureDetector(
          onTap: () => onTap(),
          child: Text(
            bttnTitle,
            style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400, color: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

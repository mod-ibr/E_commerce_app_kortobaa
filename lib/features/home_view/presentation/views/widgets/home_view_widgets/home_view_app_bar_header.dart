import 'package:flutter/material.dart';

class AppBarHeaderHomeView extends StatelessWidget {
  final String title;
  const AppBarHeaderHomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: InkWell(
            onTap: Scaffold.of(context).openDrawer,
            child: const Icon(Icons.menu),
          ),
        ),
        Text(
          title,
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.onTertiary),
        ),
      ],
    );
  }
}

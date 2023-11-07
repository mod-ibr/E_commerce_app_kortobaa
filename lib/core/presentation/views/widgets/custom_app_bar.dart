import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: theme.colorScheme.onTertiary),
      ),
      centerTitle: true,
      backgroundColor: theme.colorScheme.tertiary,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: theme.colorScheme.onPrimary),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

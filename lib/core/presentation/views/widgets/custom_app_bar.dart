import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actions;
  const CustomAppBar({super.key, required this.title, this.actions});

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
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.menu,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: theme.colorScheme.onPrimary),
        ),
        (actions != null) ? actions! : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

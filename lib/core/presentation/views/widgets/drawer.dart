import 'package:e_commerce_app/core/constants/assets/assets_images.dart';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
            ),
            child: Image.asset(AssetsImages.logo, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(locale.ar),
              onTap: () {},
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: theme.colorScheme.primary)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(locale.en),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

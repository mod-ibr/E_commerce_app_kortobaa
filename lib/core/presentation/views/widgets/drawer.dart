import 'package:e_commerce_app/core/constants/assets/assets_images.dart';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/preference_cubit/preference_cubit.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    final preferenceCubit = getPreferenceCubit(context);

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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              leading: Icon(
                Icons.language,
                size: 24.sp,
              ),
              title: Text(
                locale.ar,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              iconColor: (preferenceCubit.langCode == 'ar')
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onTertiary,
              textColor: (preferenceCubit.langCode == 'ar')
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onTertiary,
              onTap: () => preferenceCubit.toggleLocale(languageCode: "ar"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.language,
                size: 24.sp,
              ),
              title: Text(
                locale.en,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              iconColor: (preferenceCubit.langCode == 'en')
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onTertiary,
              textColor: (preferenceCubit.langCode == 'en')
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onTertiary,
              onTap: () => preferenceCubit.toggleLocale(languageCode: "en"),
            ),
          ),
        ],
      ),
    );
  }
}

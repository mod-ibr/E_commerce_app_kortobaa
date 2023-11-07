import 'dart:developer';
import 'dart:ui';

import 'package:e_commerce_app/core/constants/assets/assets_images.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/homw_view_blurred_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHomeView extends StatelessWidget {
  final String title;
  const AppBarHomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlurredImageHomeView(
      image: AssetsImages.add,
      height: 0.3.sh,
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      log("Menu Button is Tapped");
                    },
                  ),
                ),
                Text(
                  title,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: theme.colorScheme.onTertiary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/core/constants/assets/assets_images.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_app_bar_header.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_search_field.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_blurred_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/l10n.dart';

class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);

    return BlurredImageHomeView(
      image: AssetsImages.add,
      height: 0.3.sh,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                child: AppBarHeaderHomeView(title: locale.main),
              ),
              const SearchFieldHomeView()
            ],
          ),
        ),
      ),
    );
  }
}

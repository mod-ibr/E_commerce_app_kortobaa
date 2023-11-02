import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/assets/assets_images.dart';
import '../../../../../core/localization/l10n.dart';
import 'auth_log_in_view_form.dart';

class LogInViewBodyAuth extends StatelessWidget {
  const LogInViewBodyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 54.h, bottom: 32.h),
              child: Image.asset(
                AssetsImages.login,
                width: 131.w,
                height: 120.h,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 13),
              child: Text(
                locale.signIn,
                style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 79),
              child: Text(
                locale.pleaseLogInToCompletePurchase,
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onPrimary),
              ),
            ),
            const LogInViewFormAuth(),
          ],
        ),
      ),
    );
  }
}

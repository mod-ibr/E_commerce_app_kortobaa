import 'package:flutter/material.dart';
import '../../../../../core/localization/l10n.dart';
import 'auth_app_image.dart';
import 'auth_log_in_view_form.dart';

class LogInViewBodyAuth extends StatelessWidget {
  const LogInViewBodyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.08),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const AppImageAuth(),
                Text(
                  locale.signIn,
                  style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.primary),
                )
              ],
            ),
            const LogInViewFormAuth(),
          ],
        ),
      ),
    );
  }
}

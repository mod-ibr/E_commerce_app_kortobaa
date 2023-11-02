import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_log_in_view_body.dart';

class LogInViewAuth extends StatelessWidget {
  const LogInViewAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: const LogInViewBodyAuth(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: FooterAuth(
            title: locale.doNotHaveAccount,
            bttnTitle: locale.register,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, kRegisterView, (route) => false);
            }),
      ),
    );
  }
}

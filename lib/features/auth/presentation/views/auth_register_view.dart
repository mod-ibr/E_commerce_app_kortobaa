import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/utils/app_router.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_register_view_body.dart';

class RegisterViewAuth extends StatelessWidget {
  const RegisterViewAuth({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: const RegisterViewBodyAuth(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: FooterAuth(
          title: locale.haveAccount,
          bttnTitle: locale.newAccount,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, kLogInView, (route) => false);
          },
        ),
      ),
    );
  }
}

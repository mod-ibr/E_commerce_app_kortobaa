import 'package:flutter/material.dart'; 
import '../../../../../core/localization/l10n.dart';
import 'auth_app_image.dart';
import 'auth_footer.dart';
import 'auth_register_view_form.dart';

class RegisterViewBodyAuth extends StatelessWidget {
  const RegisterViewBodyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = getL10n(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppImageAuth(),
            const RegisterViewFormAuth(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
              child: FooterAuth(
                title: locale.haveAccount,
                bttnTitle: locale.newAccount,
                onTap: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, kLogInView, (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

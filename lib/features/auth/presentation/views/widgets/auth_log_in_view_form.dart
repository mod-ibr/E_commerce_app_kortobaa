import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/assets/assets_icons.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';
import '../../../../../core/presentation/views/widgets/text_form_field_custom.dart';
import '../../manager/auth_cubit/auth_cubit.dart';

class LogInViewFormAuth extends StatefulWidget {
  const LogInViewFormAuth({
    super.key,
  });

  @override
  State<LogInViewFormAuth> createState() => _LogInViewFormAuthState();
}

class _LogInViewFormAuthState extends State<LogInViewFormAuth> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // _checkOnAuthState(state, context, locale);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04),
              TextFormFieldCustom(
                hintText: 'hintText',
                textEditingController: emailController,
                obscureText: false,
                leadingIcon: AssetsIcons.email,
                validator: (value) => _validateEmail(value),
              ),
              SizedBox(height: size.height * 0.04),
              TextFormFieldCustom(
                hintText: 'hintText',
                textEditingController: passwordController,
                obscureText: true,
                leadingIcon: AssetsIcons.password,
                validator: (value) => _validatePassword(value),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedBttnCustom(
                  isLoading: (state is AuthLoading) ? true : false,
                  width: size.width * 0.5,
                  title: locale.signIn,
                  onTap: () {
                    //  _validateForm(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // void _checkOnAuthState(
  //     AuthState state, BuildContext context, AppLocalizations locale) {
  //   if (state is AuthLoggedIn) {
  //     Navigator.of(context).pushReplacementNamed(kHomeView);
  //   } else if (state is AuthFailure) {
  //     showCustomNdialog(
  //       context,
  //       title: locale.warning,
  //       content: state.failure.errorMessage ??
  //           state.failure.exceptionType.toString(),
  //       actions: [
  //         TextButton(
  //             child: Text(locale.ok), onPressed: () => Navigator.pop(context)),
  //       ],
  //     );
  //   }
  // }

  // void _validateForm(context) async {
  //   final authCubit = getAuthCubit(context);

  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     await authCubit.loginUser(
  //       requestLoginData: RequestLogin(
  //         username: emailController.text,
  //         password: passwordController.text,
  //         fcmDeviceToken: token ?? "",
  //       ),
  //     );
  //   }
  // }

  String? _validateEmail(value) {
    final regex = RegExp(emailRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid password';
    }
    return null;
  }
}

import 'package:e_commerce_app/core/utils/functions/map_failure_to_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';
import '../../../../../core/presentation/views/widgets/text_form_field_custom.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/alert_dialogs.dart';
import '../../../data/models/request_login.dart';
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

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        _checkOnAuthState(state, context, locale);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFieldCustom(
                hintText: locale.userName,
                textEditingController: userNameController,
                obscureText: false,
                validator: (value) => _validateEmail(value),
              ),
              const SizedBox(height: 47),
              TextFormFieldCustom(
                hintText: locale.password,
                textEditingController: passwordController,
                obscureText: true,
                validator: (value) => _validatePassword(value),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedBttnCustom(
                  isLoading: (state is AuthLoading) ? true : false,
                  width: size.width,
                  title: locale.enter,
                  onTap: () {
                    _validateForm(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkOnAuthState(
      AuthState state, BuildContext context, AppLocalizations locale) {
    if (state is AuthLoggedIn) {
      Navigator.of(context).pushReplacementNamed(kHomeView);
    } else if (state is AuthFailure) {
      String message = mapFailureToMessage(state.failure, context);
      showErrorAlertDialog(context, title: locale.warning, content: message);
    }
  }

  void _validateForm(context) async {
    final authCubit = getAuthCubit(context);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await authCubit.loginUser(
        requestLoginData: RequestLogin(
          username: userNameController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  String? _validateEmail(value) {
    final locale = getL10n(context);

    // final regex = RegExp(emailRegex);
    // if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    if (value == null || value.isEmpty) {
      return locale.plzEnterValidName;
    }
    return null;
  }

  String? _validatePassword(value) {
    final locale = getL10n(context);

    if (value == null || value.isEmpty) {
      return locale.plzEnterValidPass;
    }
    return null;
  }
}

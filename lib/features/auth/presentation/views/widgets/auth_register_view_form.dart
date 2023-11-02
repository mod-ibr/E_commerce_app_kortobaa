import 'package:e_commerce_app/core/utils/functions/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';
import '../../../../../core/presentation/views/widgets/text_form_field_custom.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/request_register.dart';
import '../../manager/auth_cubit/auth_cubit.dart';

class RegisterViewFormAuth extends StatefulWidget {
  const RegisterViewFormAuth({super.key});

  @override
  State<RegisterViewFormAuth> createState() => _RegisterViewFormAuthState();
}

class _RegisterViewFormAuthState extends State<RegisterViewFormAuth> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final size = MediaQuery.of(context).size;
    List<Widget> textFormFields = _getTextFormFields(locale);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        _checkOnAuthState(state, context, locale);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              for (var i = 0; i < textFormFields.length; i++) ...[
                textFormFields[i],
                const SizedBox(height: 34),
              ],
              ElevatedBttnCustom(
                width: size.width,
                title: locale.register,
                isLoading: state is AuthLoading,
                onTap: () {
                  return _validateForm(context, locale);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkOnAuthState(
      AuthState state, BuildContext context, AppLocalizations locale) {
    if (state is AuthRegister) {
      showSuccessAlertDialog(context,
          content: locale.accountCreatedSuccessfully,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
              context, kLogInView, (route) => false));
    } else if (state is AuthFailure) {
      showWarningAlertDialog(
        context,
        title: locale.warning,
        content: state.failure.errorMessage ??
            state.failure.exceptionType.toString(),
      );
    }
  }

  Future<void> _validateForm(
      BuildContext context, AppLocalizations locale) async {
    final authCubit = getAuthCubit(context);

    if (_formKey.currentState!.validate()) {
      authCubit.requestRegisterData = RequestRegister(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        username: userNameController.text,
      );

      authCubit.registerUser();
    }
  }

  List<TextFormFieldCustom> _getTextFormFields(AppLocalizations locale) => [
        TextFormFieldCustom(
          hintText: locale.userName,
          textEditingController: userNameController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return locale.plzEnterValidName;
            }
            return null;
          },
        ),
        TextFormFieldCustom(
          hintText: locale.email,
          textEditingController: emailController,
          obscureText: false,
          validator: (value) {
            final regex = RegExp(emailRegex);
            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return locale.plzEnterValidEmail;
            }
            return null;
          },
        ),
        TextFormFieldCustom(
          hintText: locale.firstName,
          textEditingController: firstNameController,
          obscureText: false,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return locale.plzEnterValidName;
            }
            return null;
          },
        ),
        TextFormFieldCustom(
          hintText: locale.lastName,
          textEditingController: lastNameController,
          obscureText: false,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return locale.plzEnterValidName;
            }
            return null;
          },
        ),
        TextFormFieldCustom(
          hintText: locale.password,
          textEditingController: passwordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 8) {
              return locale.plzEnterValidPass;
            }
            return null;
          },
        ),
        TextFormFieldCustom(
          hintText: locale.confirmPassword,
          textEditingController: confirmPasswordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 8) {
              return locale.plzEnterValidPass;
            } else if (confirmPasswordController.value !=
                passwordController.value) {
              return locale.passwordsNotMatch;
            }
            return null;
          },
        ),
      ];
}

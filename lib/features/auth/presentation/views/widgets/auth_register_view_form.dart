import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/assets/assets_icons.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';
import '../../../../../core/presentation/views/widgets/text_form_field_custom.dart';
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
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    List<Widget> textFormFields = _getTextFormFields(locale);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // _checkOnAuthState(state, context, locale);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              for (var i = 0; i < textFormFields.length; i++) ...[
                SizedBox(height: size.height * 0.04),
                textFormFields[i]
              ],
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          isChecked = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedBttnCustom(
                  width: size.width * 0.5,
                  title: locale.register,
                  isLoading: state is AuthLoading,
                  onTap: () {
                    // return _validateForm(context, locale);
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
  //   if (state is AuthRegister) {
  //     showCustomNdialog(
  //       context,
  //       content: locale.accountCreatedSuccessfully,
  //       actions: [
  //         TextButton(
  //           child: Text(locale.ok),
  //           onPressed: () {
  //             hideSystemUI();
  //             Navigator.pushNamedAndRemoveUntil(
  //                 context, kLogInView, (route) => false);
  //           },
  //         ),
  //       ],
  //     );
  //   } else if (state is AuthFailure) {
  //     showCustomNdialog(
  //       context,
  //       title: locale.warning,
  //       content: state.failure.errorMessage ??
  //           state.failure.exceptionType.toString(),
  //       actions: [
  //         TextButton(
  //             child: Text(locale.ok), onPressed: () => Navigator.pop(context))
  //       ],
  //     );
  //   }
  // }

  // Future<void> _validateForm(
  //     BuildContext context, AppLocalizations locale) async {
  //   final authCubit = getAuthCubit(context);
  //   final ManagementCubit managementCubitProvider = getManagementCubit(context);

  //   if (_formKey.currentState!.validate()) {
  //     if (!isChecked) {
  //       showCustomNdialog(
  //         context,
  //         title: locale.pleaseNote,
  //         content: locale.termsAndPrivacyNotAccepted,
  //         actions: [
  //           TextButton(
  //               child: Text(locale.ok), onPressed: () => Navigator.pop(context))
  //         ],
  //       );
  //       return;
  //     }
  //     authCubit.requestRegisterData = RequestRegister(
  //       fullName: fullNameController.text,
  //       email: emailController.text,
  //       password: passwordController.text,
  //       phoneNumber: phoneNumberController.text,
  //     );
  //     managementCubitProvider.getManagements();

  //     Navigator.pushNamed(context, kCompleteDataView);
  //   }
  // }

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
            if (value == null || value.isEmpty || value.length < 11) {
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
            if (value == null || value.isEmpty || value.length < 11) {
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

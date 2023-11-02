import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? leadingIcon;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool? obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator? validator;
  final bool readOnly;
  final Function(String)? onChanged;
  const TextFormFieldCustom({
    super.key,
    this.hintText,
    this.leadingIcon,
    required this.textEditingController,
    this.focusNode,
    this.nextFocusNode,
    this.obscureText,
    this.keyboardType = TextInputType.name,
    this.validator,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      focusNode: focusNode,
      textInputAction:
          nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onEditingComplete: () => _changeFocus(context),
      cursorColor: theme.colorScheme.primary,
      controller: textEditingController,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      onFieldSubmitted: (newValue) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      readOnly: readOnly,
      onChanged: onChanged,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.labelLarge
            ?.copyWith(color: theme.colorScheme.onSurface),
        prefixIcon: leadingIcon != null
            ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: SvgPicture.asset(leadingIcon!),
              )
            : null,
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }

  void _changeFocus(BuildContext context) {
    focusNode?.unfocus();
    if (nextFocusNode != null) {
      FocusScope.of(context).requestFocus(nextFocusNode);
    }
  }
}

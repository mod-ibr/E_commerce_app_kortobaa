import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldHomeView extends StatelessWidget {
  const SearchFieldHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    return TextFormField(
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
        fillColor: theme.colorScheme.tertiary.withOpacity(0.5),
        hintText: locale.searchFor,
        prefixIcon: Icon(
          Icons.search,
          size: 22.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.colorScheme.tertiary.withOpacity(0.4)),
          borderRadius: const BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.colorScheme.tertiary.withOpacity(0.4)),
          borderRadius: const BorderRadius.all(
            Radius.circular(200),
          ),
        ),
      ),
    );
  }
}

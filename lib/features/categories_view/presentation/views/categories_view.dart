import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:e_commerce_app/core/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/categories_view/presentation/views/widgets/categories_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: CustomAppBar(title: locale.classifications),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: const CategoriesViewBody(),
      ),
    );
  }
}

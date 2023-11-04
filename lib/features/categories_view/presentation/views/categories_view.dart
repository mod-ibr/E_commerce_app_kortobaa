import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:e_commerce_app/core/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/categories_view/presentation/views/widgets/categories_body.dart';
import 'package:flutter/material.dart';

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
      appBar: CustomAppBar(title: locale.classifications),
      backgroundColor: theme.colorScheme.surface,
      body: const CategoriesBody(),
    );
  }
}

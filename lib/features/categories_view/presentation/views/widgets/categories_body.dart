import 'dart:developer';

import 'package:e_commerce_app/features/categories_view/data/models/categories/result.dart';
import 'package:e_commerce_app/features/categories_view/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../manager/categories_cubit/categories_cubit.dart';
import '../../manager/categories_cubit/categories_state.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          List<Result>? allCategories = state.categories.results;
          if (allCategories == null || allCategories.isEmpty) {
            return Center(
              child: Text(locale.noInformationYet),
            );
          }
          return ListView.builder(
            itemCount: allCategories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () =>
                  log("Category of ${allCategories[index].name} was selected"),
              child: CategoryCard(
                result: allCategories[index],
              ),
            ),
          );
        } else if (state is CategoriesFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return ErrorWidgetCustom(message: message);
        }
        return const LoadingWidget();
      },
    );
  }
}

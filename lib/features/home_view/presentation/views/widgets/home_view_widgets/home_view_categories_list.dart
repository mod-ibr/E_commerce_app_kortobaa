import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../../../../core/presentation/views/widgets/inline_error_widget.dart';
import '../../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../../../../categories_view/data/models/categories/categories.dart';
import '../../../../../categories_view/data/models/categories/result.dart';
import '../../../../../categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../../../../categories_view/presentation/manager/categories_cubit/categories_state.dart';
import 'home_view_category_circle_avatar.dart';

class CategoriesListHomeView extends StatelessWidget {
  const CategoriesListHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const LoadingWidget();
        }
        if (state is CategoriesSuccessState) {
          successCategories(categories: state.categories, context: context);
        } else if (state is CategoriesFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return InlineErrorWidgetCustom(message: message);
        }
        Categories? categories = getCategoriesCubit(context).categories;
        if (categories != null) {
          return successCategories(categories: categories, context: context);
        }
        return InlineErrorWidgetCustom(message: locale.serverFailureMessage);
      },
    );
  }

  Widget successCategories(
      {required Categories categories, required BuildContext context}) {
    final locale = getL10n(context);

    List<Result>? allCategories = categories.results;
    if (allCategories == null || allCategories.isEmpty) {
      return Center(
        child: Text(locale.noInformationYet),
      );
    }
    return SizedBox(
      height: 0.11.sh,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length * 2,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              log("Category of ${allCategories[index].name} was selected"),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CategoryCircleAvatarHomeView(
              imageLink: allCategories[index % allCategories.length].imageLink,
              label: allCategories[index % allCategories.length].name,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 8.sp),
      ),
    );
  }
}

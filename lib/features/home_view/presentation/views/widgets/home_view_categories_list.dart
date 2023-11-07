import 'dart:developer';
import 'package:e_commerce_app/core/utils/functions/map_failure_to_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../categories_view/data/models/categories/result.dart' as cat;
import '../../../../categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../../../categories_view/presentation/manager/categories_cubit/categories_state.dart';
import 'home_view_category_circle_avatar.dart';

class CategoriesListHomeView extends StatelessWidget {
  const CategoriesListHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          List<cat.Result>? allCategories = state.categories.results;
          if (allCategories == null || allCategories.isEmpty) {
            return Center(
              child: Text(locale.noInformationYet),
            );
          }
          return SizedBox(
            height: 80.sp,
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: allCategories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => log(
                    "Category of ${allCategories[index].name} was selected"),
                child: CategoryCircleAvatarHomeView(
                  imageLink: allCategories[index].imageLink,
                  label: allCategories[index].name,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 8.sp),
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

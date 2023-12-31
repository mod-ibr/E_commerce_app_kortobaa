import 'dart:developer';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../../manager/products cubit/products_cubit.dart';
import 'home_view_categories_list.dart';
import 'home_view_products_list.dart';
import 'home_view_section_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    getCategoriesCubit(context).getCategories();
    getProductsCubit(context).getProducts();
    final locale = getL10n(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          //* Categories
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sp),
            child: const CategoriesListHomeView(),
          ),
          //* Recently Added
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.sp, bottom: 8.sp),
            child: SectionTitleHomeView(
              title: locale.recentlyAdded,
              seeAllFunction: () => log("See all ${locale.recentlyAdded}"),
            ),
          ),
          const ProductsListHomeView(),
          //* Recently Added

          Padding(
            padding: EdgeInsetsDirectional.only(top: 32.sp, bottom: 8.sp),
            child: SectionTitleHomeView(
              title: locale.mostPopular,
              seeAllFunction: () => log("See all ${locale.mostPopular}"),
            ),
          ),
          const ProductsListHomeView(),
          SizedBox(
            height: 32.sp,
          )
        ],
      ),
    );
  }
}

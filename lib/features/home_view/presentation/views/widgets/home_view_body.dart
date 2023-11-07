import 'dart:developer';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../../../categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../../data/models/products/result.dart' as pr;
import '../../manager/products cubit/products_cubit.dart';
import '../../manager/products cubit/products_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    getCategoriesCubit(context).getCategories();
    getProductsCubit(context).getProducts();
    final locale = getL10n(context);
    return Column(
      children: [
        //* Categories
       const CategoriesListHomeView(),
        //* Products
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccessState) {
              List<pr.Result>? allProducts = state.products.results;
              if (allProducts == null || allProducts.isEmpty) {
                return Center(
                  child: Text(locale.noInformationYet),
                );
              }
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () => log(
                          "Category of ${allProducts[index].name} was selected"),
                      child: Text("${allProducts[index].name}")),
                ),
              );
            } else if (state is ProductsFailure) {
              String message = mapFailureToMessage(state.failure, context);
              return ErrorWidgetCustom(message: message);
            }
            return const LoadingWidget();
          },
        )
      ],
    );
  }
}

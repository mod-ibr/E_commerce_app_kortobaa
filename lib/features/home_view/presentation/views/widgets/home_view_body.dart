import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_categories_list.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_products_List.dart';
import 'package:flutter/material.dart';
import '../../../../categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../manager/products cubit/products_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    getCategoriesCubit(context).getCategories();
    getProductsCubit(context).getProducts();
    return const SingleChildScrollView(
      child: Column(
        children: [
          //* Categories
          CategoriesListHomeView(),
          //* Products
          ProductsListHomeView()
        ],
      ),
    );
  }
}

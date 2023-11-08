import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../features/cart_view/presentation/views/cart_view.dart';
import '../../../../features/categories_view/presentation/views/categories_view.dart';
import '../../../../features/favorite/presentation/views/favorite_view.dart';
import '../../../../features/home_view/presentation/views/home_view.dart';
import '../../../../features/products_view/presentation/views/products_view.dart';
import '../../../../features/profile_view/presentation/views/profile_view.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingInitialState());
  int bottomNavIndex = 0;
  final List<Widget> pages = [
    const HomeView(),
    const CategoriesView(),
    const FavoriteView(),
    const ProfileView(),
    const CartView(),
    const ProductsView(),
  ];
  Map<String, IconData> getTabsIcons(BuildContext context) {
    final locale = getL10n(context);

    return {
      locale.main: Icons.home,
      locale.categories: Icons.category,
      locale.favorite: Icons.favorite,
      locale.profile: Icons.person,
    };
  }

  void showCartPage() {
    bottomNavIndex = pages.indexWhere((element) => element is CartView);

    emit(ChangePageState());
  }

  void showProductPage() {
    bottomNavIndex = pages.indexWhere((element) => element is ProductsView);
    emit(ChangePageState());
  }

  void showPageByIndex(int index) {
    bottomNavIndex = index;
    emit(ChangePageState());
  }
}

ShoppingCubit getShoppingCubit(BuildContext context) =>
    BlocProvider.of<ShoppingCubit>(context, listen: false);

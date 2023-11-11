import 'package:flutter/material.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/presentation/views/widgets/custom_app_bar.dart';
import '../../../../core/presentation/views/widgets/drawer.dart';
import '../manager/cart_cubit/cart_cubit.dart';
import 'widget/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    final CartCubit cartCubitProvider = getCartCubit(context);
    cartCubitProvider.getAllProductsFromCart();
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      drawer: const DrawerCustom(),
      appBar: CustomAppBar(
        title: locale.shoppingBasket,
        actions: IconButton(
            onPressed: () => cartCubitProvider.cleanCart(),
            icon: Icon(
              Icons.delete_forever_sharp,
              color: theme.colorScheme.error,
            )),
      ),
      body: const CartViewBody(),
    );
  }
}

import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/product_view_widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/l10n.dart';
import '../../../../core/presentation/views/widgets/drawer.dart';
import '../../../../core/presentation/views/widgets/inline_error_widget.dart';
import '../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../core/utils/functions/map_failure_to_message.dart';
import '../../data/models/products/result.dart';
import '../manager/products cubit/products_state.dart';
import 'widgets/product_view_widgets/product_view_app_bar.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const LoadingWidget();
        }
        if (state is ProductsSuccessState) {
          successProduct(product: state.result!, context: context);
        } else if (state is ProductsFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return InlineErrorWidgetCustom(message: message);
        }
        Result? product = getProductsCubit(context).product;
        if (product != null) {
          return successProduct(product: product, context: context);
        }
        return InlineErrorWidgetCustom(message: locale.serverFailureMessage);
      },
    );
  }

  Widget successProduct(
      {required Result product, required BuildContext context}) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBarProductView(product: product),
      drawer: const DrawerCustom(),
      body: ProductViewBody(product: product),
    );
  }
}

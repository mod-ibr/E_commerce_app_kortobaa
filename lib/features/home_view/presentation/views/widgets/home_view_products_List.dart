import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../../data/models/products/products.dart';
import '../../../data/models/products/result.dart' as pr;
import '../../manager/products cubit/products_cubit.dart';
import '../../manager/products cubit/products_state.dart';

class ProductsListHomeView extends StatelessWidget {
  const ProductsListHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const LoadingWidget();
        }
        if (state is ProductsSuccessState) {
          successProducts(products: state.products, context: context);
        } else if (state is ProductsFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return ErrorWidgetCustom(message: message);
        }
        Products? products = getProductsCubit(context).products;
        if (products != null) {
          return successProducts(products: products, context: context);
        }
        return ErrorWidgetCustom(message: locale.serverFailureMessage);
      },
    );
  }

  Widget successProducts(
      {required Products products, required BuildContext context}) {
    List<pr.Result>? allProducts = products.results;
    final locale = getL10n(context);

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
          onTap: () =>
              log("Category of ${allProducts[index].name} was selected"),
          child: Text("${allProducts[index].name}"),
        ),
      ),
    );
  }
}

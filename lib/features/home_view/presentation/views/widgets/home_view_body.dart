import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../../data/models/products/result.dart';
import '../../manager/products cubit/products_cubit.dart';
import '../../manager/products cubit/products_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          List<Result>? allProducts = state.products.results;
          if (allProducts == null || allProducts.isEmpty) {
            return Center(
              child: Text(locale.noInformationYet),
            );
          }
          return ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    log("Category of ${allProducts[index].name} was selected"),
                child: Text("${allProducts[index].name}")),
          );
        } else if (state is ProductsFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return ErrorWidgetCustom(message: message);
        }
        return const LoadingWidget();
      },
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/inline_error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../../data/models/products/products.dart';
import '../../../data/models/products/result.dart';
import '../../manager/products cubit/products_cubit.dart';
import '../../manager/products cubit/products_state.dart';
import 'home_view_product_card.dart';

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
          successProducts(products: state.products!, context: context);
        } else if (state is ProductsFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return InlineErrorWidgetCustom(message: message);
        }
        Products? products = getProductsCubit(context).products;
        if (products != null) {
          return successProducts(products: products, context: context);
        }
        return InlineErrorWidgetCustom(message: locale.serverFailureMessage);
      },
    );
  }

  Widget successProducts(
      {required Products products, required BuildContext context}) {
    List<Result>? allProducts = products.results;
    final locale = getL10n(context);

    if (allProducts == null || allProducts.isEmpty) {
      return Center(
        child: Text(locale.noInformationYet),
      );
    }
    return SizedBox(
      height: 0.24.sh,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: allProducts.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              log("Category of ${allProducts[index].name} was selected"),
          child: ProductCardHomeView(
            product: allProducts[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 12.sp),
      ),
    );
  }
}

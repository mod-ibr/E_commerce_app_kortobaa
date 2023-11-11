import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/inline_error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../home_view/data/models/products/result.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import '../../manager/cart_cubit/cart_state.dart';
import 'cart_view_products_list.dart';
import 'cart_view_summary_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final CartCubit cartCubitProvider = getCartCubit(context);

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadingSate) {
          return const LoadingWidget();
        }
        if (state is CartSuccessState) {
          successProducts(
              allProductsFromCart: cartCubitProvider.allProductsFromCart,
              context: context);
        } else if (state is CartFailure) {
          return InlineErrorWidgetCustom(
              message: locale.localeStorageFailureMessage);
        }
        List<Result>? allProductsFromCart =
            getCartCubit(context).allProductsFromCart;
        if (allProductsFromCart != null) {
          return successProducts(
              allProductsFromCart: allProductsFromCart, context: context);
        }
        return InlineErrorWidgetCustom(message: locale.serverFailureMessage);
      },
    );
  }

  Widget successProducts(
      {required List<Result>? allProductsFromCart,
      required BuildContext context}) {
    // TODO : Check if the All products Length is == null or Empty
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.sp),
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.sp, bottom: 8.sp),
            child: const SummaryHeaderCartView(),
          ),
          const Expanded(child: ProductsListCartView()),
        ],
      ),
    );
  }
}

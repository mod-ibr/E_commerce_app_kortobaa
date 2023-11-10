import 'package:e_commerce_app/features/cart_view/presentation/views/widget/cart_view_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class ProductsListCartView extends StatelessWidget {
  const ProductsListCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubitProvider = getCartCubit(context);

    return ListView.separated(
      itemCount: cartCubitProvider.allProductsFromCart!.length,
      itemBuilder: (context, index) => ProductItemCartView(
          product: cartCubitProvider.allProductsFromCart![index]),
      separatorBuilder: (context, index) => SizedBox(height: 16.sp),
    );
  }
}

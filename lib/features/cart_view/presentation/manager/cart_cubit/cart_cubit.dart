import 'dart:developer';
import 'package:e_commerce_app/features/cart_view/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home_view/data/models/products/result.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  List<Result>? allProductsFromCart;
  CartCubit({
    required this.cartRepo,
  }) : super(CartInitialSate());

  Future<void> initFavoriteDb() async {
    cartRepo.initDb();
  }

  Future<void> addProductToCart({required Result product}) async {
    try {
      cartRepo
          .addProductToCart(product: product)
          .then((value) => log("Product Added Successfully"));
    } catch (e) {
      log("ERROR in addProductToCart: ${e.toString()}");
    }
  }

  Future<void> getAllProductsFromCart() async {
    emit(CartLoadingSate());
    // try {
      await cartRepo.getAllProductsFromCart().then((value) {
        allProductsFromCart = value;
        log("All Product Retrieved Successfully with length : ${value.length}");
        for (var element in value) {
          log("Id : ${element.id} , Price : ${element.price}");
        }
        emit(CartSuccessState(products: value));
      });
    // } catch (e) {
    //   log("ERROR in getAllProductsFromCart: ${e.toString()}");
    //   emit(CartFailure());
    // }
  }

  Future<void> updateProductInCart({required Result product}) async {
    try {
      await cartRepo
          .updateProductInCart(product: product)
          .then((value) => log("Product Updated Successfully"));
    } catch (e) {
      log("ERROR in updateProductInCart: ${e.toString()}");
    }
  }

  Future<void> removeProductFromCart({required int productId}) async {
    try {
      await cartRepo
          .removeProductFromCart(productId: productId)
          .then((value) => log("Product Removed Successfully"));
    } catch (e) {
      log("ERROR in removeProductFromCart: ${e.toString()}");
    }
  }

  Future<void> cleanCart() async {
    emit(CartLoadingSate());

    try {
      await cartRepo
          .cleanCart()
          .then((value) => log("All Products Removed Successfully"));
      allProductsFromCart!.clear();
      emit(CartSuccessState());
    } catch (e) {
      log("ERROR in cleanCart: ${e.toString()}");
      emit(CartFailure());
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    if (allProductsFromCart != null && allProductsFromCart!.isNotEmpty) {
      for (var element in allProductsFromCart!) {
        log("Price :${element.price}");
        total += double.parse(element.price ?? "0.0");
      }
    }
    return total;
  }
}

CartCubit getCartCubit(BuildContext context) =>
    BlocProvider.of<CartCubit>(context, listen: false);

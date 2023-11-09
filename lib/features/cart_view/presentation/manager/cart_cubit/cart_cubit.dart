import 'dart:developer';
import 'package:e_commerce_app/features/cart_view/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home_view/data/models/products/result.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({
    required this.cartRepo,
  }) : super(CartInitialSate());

  Future<void> initFavoriteDb() async {
    cartRepo.initDb();
  }

  Future<void> addProductToCart({required Result product}) async {
    try {
      cartRepo.addProductToCart(product: product);
    } catch (e) {
      log("ERROR in addProductToCart: ${e.toString()}");
    }
  }

  Future<void> getAllProductsFromCart() async {
    try {
      await cartRepo.getAllProductsFromCart();
    } catch (e) {
      log("ERROR in getAllProductsFromCart: ${e.toString()}");
    }
  }

  Future<void> updateProductInCart({required Result product}) async {
    try {
      await cartRepo.updateProductInCart(product: product);
    } catch (e) {
      log("ERROR in updateProductInCart: ${e.toString()}");
    }
  }

  Future<void> removeProductFromCart({required int productId}) async {
    try {
      await cartRepo.removeProductFromCart(productId: productId);
    } catch (e) {
      log("ERROR in removeProductFromCart: ${e.toString()}");
    }
  }

  Future<void> cleanCart() async {
    try {
      await cartRepo.cleanCart();
    } catch (e) {
      log("ERROR in cleanCart: ${e.toString()}");
    }
  }
}

CartCubit getCartCubit(BuildContext context) =>
    BlocProvider.of<CartCubit>(context, listen: false);

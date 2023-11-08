import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/favorite/favorite.dart';
import '../../../data/repos/favorite_repo.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({
    required this.favoriteRepo,
  }) : super(FavoriteInitialSate());

  Future<void> initFavoriteDb() async {
    favoriteRepo.initDb();
  }

  Future<void> addProductToFavorite({required Favorite favorite}) async {
    try {
      favoriteRepo.addProductToFavorite(favorite: favorite);
    } catch (e) {
      log("ERROR in addProductToFavorite: ${e.toString()}");
    }
  }

  Future<void> getAllFavorites() async {
    try {
      await favoriteRepo.getAllFavorites();
    } catch (e) {
      log("ERROR in getAllFavorites: ${e.toString()}");
    }
  }

  Future<void> updateProductInFavorites({required Favorite favorite}) async {
    try {
      await favoriteRepo.updateProductInFavorites(favorite: favorite);
    } catch (e) {
      log("ERROR in updateProductInFavorites: ${e.toString()}");
    }
  }

  Future<void> removeProductFromFavorite({required int productId}) async {
    try {
      await favoriteRepo.removeProductFromFavorite(productId: productId);
    } catch (e) {
      log("ERROR in removeProductFromFavorite: ${e.toString()}");
    }
  }

  Future<void> cleanAllFavorite() async {
    try {
      await favoriteRepo.cleanAllFavorite();
    } catch (e) {
      log("ERROR in cleanAllFavorite: ${e.toString()}");
    }
  }
}

FavoriteCubit getFavoriteCubit(BuildContext context) =>
    BlocProvider.of<FavoriteCubit>(context, listen: false);

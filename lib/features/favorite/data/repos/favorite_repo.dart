import '../models/favorite/favorite.dart';

abstract class FavoriteRepo {
  Future<void> initDb();
  Future<void> addProductToFavorite({required Favorite favorite});
  Future<List<Favorite>> getAllFavorites();
  Future<void> removeProductFromFavorite({required int productId});
  Future<void> updateProductInFavorites({required Favorite favorite});
  Future<void> cleanAllFavorite();
}

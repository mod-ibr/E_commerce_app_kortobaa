import 'package:e_commerce_app/features/favorite/data/models/favorite/favorite.dart';
import '../favorite_locale_services.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  FavoriteRepoImpl();

  @override
  Future<void> initDb() async {
    await FavoriteLocaleServices.instance.database;
  }

  @override
  Future<void> addProductToFavorite({required Favorite favorite}) async {
    await FavoriteLocaleServices.instance
        .addProductToFavorite(favorite: favorite);
  }

  @override
  Future<List<Favorite>> getAllFavorites() async {
    return await FavoriteLocaleServices.instance.getAllFavorites();
  }

  @override
  Future<void> removeProductFromFavorite({required int productId}) async {
    FavoriteLocaleServices.instance
        .removeProductFromFavorite(productId: productId);
  }

  @override
  Future<void> updateProductInFavorites({required Favorite favorite}) async {
    await FavoriteLocaleServices.instance
        .updateProductInFavorites(favorite: favorite);
  }

  @override
  Future<void> cleanAllFavorite() async {
    await FavoriteLocaleServices.instance.cleanAllFavorite();
  }
}

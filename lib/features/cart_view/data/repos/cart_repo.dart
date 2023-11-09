import '../../../home_view/data/models/products/result.dart';

abstract class CartRepo {
  Future<void> initDb();
  Future<void> addProductToCart({required Result product});
  Future<List<Result>> getAllProductsFromCart();
  Future<void> updateProductInCart({required Result product});
  Future<void> cleanCart();
  Future<void> removeProductFromCart({required int productId});
}

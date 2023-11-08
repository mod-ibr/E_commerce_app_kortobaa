import '../models/cart/product.dart';

abstract class CartRepo {
  Future<void> initDb();
  Future<void> addProductToCart({required Product product});
  Future<List<Product>> getAllProductsFromCart();
  Future<void> updateProductInCart({required Product product});
  Future<void> cleanCart();
  Future<void> removeProductFromCart({required int productId});
}

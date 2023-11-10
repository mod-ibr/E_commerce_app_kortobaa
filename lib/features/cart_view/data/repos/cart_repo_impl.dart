import 'package:e_commerce_app/features/cart_view/data/repos/cart_repo.dart';
import '../../../home_view/data/models/products/result.dart';
import '../cart_locale_services.dart';

class CartRepoImpl extends CartRepo {
  CartRepoImpl();

  @override
  Future<void> initDb() async {
    await CartLocaleServices.instance.database;
  }

  @override
  Future<void> addProductToCart({required Result product}) async {
    await CartLocaleServices.instance.addProductToCart(product: product);
  }

  @override
  Future<List<Result>> getAllProductsFromCart() async {
    return await CartLocaleServices.instance.getAllProductsFromCart();
  }

  @override
  Future<void> removeProductFromCart({required int productId}) async {
    CartLocaleServices.instance.removeProductFromCart(productId: productId);
  }

  @override
  Future<void> updateProductInCart({required Result product}) async {
    await CartLocaleServices.instance.updateProductInCart(product: product);
  }

  @override
  Future<void> cleanCart() async {
    await CartLocaleServices.instance.cleanCart();
  }
}

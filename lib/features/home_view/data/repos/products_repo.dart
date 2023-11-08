import '../models/products/products.dart';

abstract class ProductsRepo {
  Future<Products> getProducts({required String token});
}

import '../models/products/products.dart';
import '../models/products/result.dart';

abstract class ProductsRepo {
  Future<Products> getProducts({required String token});
  Future<Result> getProductById(
      {required String token, required String productId});
}

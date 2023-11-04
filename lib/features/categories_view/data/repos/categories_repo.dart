import '../models/categories/categories.dart';

abstract class CategoriesRepo {
  Future<Categories> getCategories({required String token});
}

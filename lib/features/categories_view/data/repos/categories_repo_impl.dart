import 'dart:convert';
import 'dart:developer';
import '../../../../../../core/data/api_services.dart';
import '../../../../../../core/error/exceptions.dart';
import '../models/categories/categories.dart';
import 'categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiServices apiServices;

  CategoriesRepoImpl({required this.apiServices});

  @override
  Future<Categories> getCategories({required String token}) async {
    var response =
        await apiServices.get(endPoint: "/api/v1/categories", token: token);

    final decodedJson = json.decode(response.body);
    log("Response from getCategories : $decodedJson");

    if (response.statusCode == 200) {
      Categories categories =
          Categories.fromJson(decodedJson as Map<String, dynamic>);

      return categories;
    } else {
      throw ServerException();
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce_app/features/home_view/data/models/products/result.dart';

import '../../../../../../core/data/api_services.dart';
import '../../../../../../core/error/exceptions.dart';
import '../models/products/products.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiServices apiServices;

  ProductsRepoImpl({required this.apiServices});

  @override
  Future<Products> getProducts({required String token}) async {
    var response =
        await apiServices.get(endPoint: "/api/v1/products/", token: token);

    final decodedJson = json.decode(response.body);
    log("Response from getProducts : $decodedJson");

    if (response.statusCode == 200) {
      Products products =
          Products.fromJson(decodedJson as Map<String, dynamic>);

      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Result> getProductById(
      {required int productId, required String token}) async {
    var response = await apiServices.get(
        endPoint: "/api/v1/products/$productId/", token: token);

    final decodedJson = json.decode(response.body);
    log("Response from getProductById : $decodedJson");

    if (response.statusCode == 200) {
      Result result = Result.fromJson(decodedJson[0] as Map<String, dynamic>);

      return result;
    } else {
      throw ServerException();
    }
  }
}

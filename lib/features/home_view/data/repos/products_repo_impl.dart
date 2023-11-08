import 'dart:convert';
import 'dart:developer';
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
}

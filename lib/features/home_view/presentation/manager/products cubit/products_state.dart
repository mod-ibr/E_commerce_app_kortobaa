import 'package:e_commerce_app/features/home_view/data/models/products/products.dart';

import '../../../../../core/error/failures.dart';
import '../../../data/models/products/result.dart';

sealed class ProductsState {}

final class ProductsInitialSate extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductImageSliderChanged extends ProductsState {
  final int index;

  ProductImageSliderChanged({required this.index});
}

final class ProductsSuccessState extends ProductsState {
  final Products? products;
  final Result? result;
  ProductsSuccessState({
    this.products,
    this.result,
  });
}

final class ProductsFailure extends ProductsState {
  final Failure failure;

  ProductsFailure({required this.failure});
}

final class AmountChangedState extends ProductsState {}


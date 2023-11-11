import '../../../../home_view/data/models/products/result.dart';

sealed class CartState {}

final class CartInitialSate extends CartState {}

final class CartLoadingSate extends CartState {}

final class CartSuccessState extends CartState {
  final List<Result>? products;

  CartSuccessState({this.products});
}

final class CartFailure extends CartState {}

import '../../../../../core/error/failures.dart';
import '../../../data/models/cart/product.dart';

sealed class CartState {}

final class CartInitialSate extends CartState {}

final class CartSuccessState extends CartState {
  final List<Product> products;

  CartSuccessState({required this.products});
}

final class CartFailure extends CartState {
  final Failure failure;

  CartFailure({required this.failure});
}

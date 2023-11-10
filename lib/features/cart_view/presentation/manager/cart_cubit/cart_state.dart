import '../../../../../core/error/failures.dart';
import '../../../../home_view/data/models/products/result.dart';

sealed class CartState {}

final class CartInitialSate extends CartState {}
final class CartLoadingSate extends CartState {}

final class CartSuccessState extends CartState {
  final List<Result> products;

  CartSuccessState({required this.products});
}

final class CartFailure extends CartState {
  final Failure failure;

  CartFailure({required this.failure});
}

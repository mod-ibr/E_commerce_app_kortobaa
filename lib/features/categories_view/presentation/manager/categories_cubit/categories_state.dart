import '../../../../../../../core/error/failures.dart';
import '../../../data/models/categories/categories.dart';

sealed class CategoriesState {}

final class CategoriesInitialSate extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {
  final Categories categories;

  CategoriesSuccessState({required this.categories});
}

final class CategoriesFailure extends CategoriesState {
  final Failure failure;

  CategoriesFailure({required this.failure});
}

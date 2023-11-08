
import '../../../../../core/error/failures.dart';
import '../../../data/models/favorite/favorite.dart';

sealed class FavoriteState {}

final class FavoriteInitialSate extends FavoriteState {}


final class FavoriteSuccessState extends FavoriteState {
  final Favorite favorite;

  FavoriteSuccessState({required this.favorite});
}

final class FavoriteFailure extends FavoriteState {
  final Failure failure;

  FavoriteFailure({required this.failure});
}

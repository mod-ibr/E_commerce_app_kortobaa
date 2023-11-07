import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/error/exceptions.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../../../../core/network/network_connection_checker.dart';
import '../../../../../../../core/presentation/manager/preference_cubit/preference_cubit.dart';
import '../../../data/models/categories/categories.dart';
import '../../../data/repos/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  final PreferenceCubit preferenceCubit;
  final NetworkConnectionChecker networkConnectionChecker;
  Categories? categories;

  CategoriesCubit({
    required this.categoriesRepo,
    required this.preferenceCubit,
    required this.networkConnectionChecker,
  }) : super(CategoriesInitialSate());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await _getCategories();

    result.fold(
      (failure) => emit(CategoriesFailure(failure: failure)),
      (categories) async {
        this.categories = categories;
        emit(CategoriesSuccessState(categories: categories));
      },
    );
  }

  Future<Either<Failure, Categories>> _getCategories() async {
    if (await networkConnectionChecker.isConnected) {
      try {
        var result = await categoriesRepo.getCategories(
            token: preferenceCubit.userData!.accessToken);

        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

CategoriesCubit getCategoriesCubit(BuildContext context) =>
    BlocProvider.of<CategoriesCubit>(context, listen: false);

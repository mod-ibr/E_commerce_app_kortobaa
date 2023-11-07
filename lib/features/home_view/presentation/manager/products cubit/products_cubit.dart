import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home_view/data/models/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/error/exceptions.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../../../../core/network/network_connection_checker.dart';
import '../../../../../../../core/presentation/manager/preference_cubit/preference_cubit.dart';
import '../../../../../core/constants/assets/assets_images.dart';
import '../../../data/repos/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  final PreferenceCubit preferenceCubit;
  final NetworkConnectionChecker networkConnectionChecker;
  final productsImageSliderList = [AssetsImages.add, AssetsImages.cmen];
  int selectedSliderImage = 0;
  ProductsCubit({
    required this.productsRepo,
    required this.preferenceCubit,
    required this.networkConnectionChecker,
  }) : super(ProductsInitialSate());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await _getProducts();

    result.fold(
      (failure) => emit(ProductsFailure(failure: failure)),
      (products) async {
        emit(ProductsSuccessState(products: products));
      },
    );
  }

  Future<Either<Failure, Products>> _getProducts() async {
    if (await networkConnectionChecker.isConnected) {
      try {
        var result = await productsRepo.getProducts(
            token: preferenceCubit.userData!.accessToken);

        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  sliderOnChange(int index) {
    selectedSliderImage = index;
    emit(ProductImageSliderChanged(index: index));
  }
}

ProductsCubit getProductsCubit(BuildContext context) =>
    BlocProvider.of<ProductsCubit>(context, listen: false);

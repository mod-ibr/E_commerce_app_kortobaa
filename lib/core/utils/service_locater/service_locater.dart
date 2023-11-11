import 'package:e_commerce_app/core/network/network_connection_checker.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce_app/features/cart_view/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/cart_view/data/repos/cart_repo_impl.dart';
import 'package:e_commerce_app/features/cart_view/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:e_commerce_app/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:e_commerce_app/features/home_view/data/repos/products_repo.dart';
import 'package:e_commerce_app/features/home_view/data/repos/products_repo_impl.dart';
import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../features/categories_view/data/repos/categories_repo.dart';
import '../../../features/categories_view/data/repos/categories_repo_impl.dart';
import '../../../features/categories_view/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../../features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../../data/api_services.dart';
import '../../presentation/manager/preference_cubit/preference_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../presentation/manager/shopping_cubit/shopping_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //! Features
// App  Cubit
  sl.registerFactory<PreferenceCubit>(
    () => PreferenceCubit(sharedPreferences: sl<SharedPreferences>())
      ..getLocaleFromCache()
      ..getUserData(),
  );

  sl.registerFactory<ShoppingCubit>(() => ShoppingCubit());

  // Auth Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      authRepo: sl(),
      preferenceCubit: sl(),
      networkConnectionChecker: sl(),
    ),
  );

// Categories Cubit
  sl.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(
      categoriesRepo: sl(),
      preferenceCubit: sl(),
      networkConnectionChecker: sl(),
    ),
  );
  // Home view Cubit
  sl.registerFactory<ProductsCubit>(
    () => ProductsCubit(
      productsRepo: sl(),
      preferenceCubit: sl(),
      networkConnectionChecker: sl(),
    ),
  );
  // Favorite view Cubit
  sl.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(favoriteRepo: sl()),
  );
  // Cart view Cubit
  sl.registerFactory<CartCubit>(() => CartCubit(cartRepo: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiServices: sl()));
  sl.registerLazySingleton<CategoriesRepo>(
      () => CategoriesRepoImpl(apiServices: sl()));
  sl.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImpl(apiServices: sl()));
  sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl());
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl());
  //! Core

  // Services
  sl.registerLazySingleton<ApiServices>(() => ApiServices(sl()));
  sl.registerLazySingleton<NetworkConnectionChecker>(
      () => NetworkConnectionCheckerImpl(sl()));

  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}

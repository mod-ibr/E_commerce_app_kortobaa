import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/auth/data/repos/auth_repo.dart';
import '../../../features/auth/data/repos/auth_repo_impl.dart';
import '../../data/api_services.dart';
import '../../presentation/manager/preference_cubit/preference_cubit.dart';
import 'core/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //* Features
  //ex: Repository, BLoCs/Cubits etc...
  sl.registerLazySingleton<PreferenceCubit>(
    () => PreferenceCubit(sharedPreferences: sl<SharedPreferences>()),
  );

  //?Auth
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(apiServices: sl<ApiServices>()));

  //?Notifications

  //?Main

  //* Core
  //ex: ApiService, etc...
  await setUpSharedPreference(sl);

  //* External
  //ex: Dio, etc...
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiServices>(
    () => ApiServices(sl<Dio>(), sl<PreferenceCubit>()),
  );
  sl.registerLazySingleton<ConnectivityWrapper>(
      () => ConnectivityWrapper.instance);
}

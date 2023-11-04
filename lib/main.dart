import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:e_commerce_app/core/constants/constants.dart';
import 'package:e_commerce_app/core/network/network_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart' as pc;
import 'core/localization/l10n.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart';
import 'core/theme/theme_data.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locater/service_locater.dart' as di;
import 'package:device_preview/device_preview.dart';

import 'features/auth/data/repos/auth_repo.dart';
import 'features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PreferenceCubit>()..getLocaleFromCache()),
        BlocProvider(
          create: (_) => AuthCubit(
            authRepo: di.sl<AuthRepo>(),
            preferenceCubit: di.sl<PreferenceCubit>(),
            networkConnectionChecker: di.sl<NetworkConnectionChecker>(),
          ),
        ),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final preferenceCubit = pc.getPreferenceCubit(context);
    return BlocBuilder<PreferenceCubit, PreferenceState>(
      builder: (_, state) => ConnectivityAppWrapper(
        app: ScreenUtilInit(
          designSize: const Size(360, 795),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: preferenceCubit.langCode == "en"
                  ? 'E-commerce App'
                  : 'متجر إلكتروني',
              theme: kLightThemeData,
              locale: Locale(preferenceCubit.langCode),
              onGenerateRoute: AppRouter.generateRoute,
              supportedLocales: L10n.supportedLocales,
              localizationsDelegates: L10n.localizationsDelegates,
            );
          },
        ),
      ),
    );
  }
}

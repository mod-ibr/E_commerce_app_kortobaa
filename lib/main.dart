import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/constants.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart' as pc;
import 'core/localization/l10n.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart';
import 'core/presentation/manager/shopping_cubit/shopping_cubit.dart';
import 'core/theme/theme_data.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locater/service_locater.dart' as di;
import 'package:device_preview/device_preview.dart';
import 'features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PreferenceCubit>(
          create: (_) => di.sl<PreferenceCubit>()
            ..getLocaleFromCache()
            ..getUserData(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>(),
        ),
        BlocProvider<ShoppingCubit>(
          create: (_) => di.sl<ShoppingCubit>(),
        ),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
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
      builder: (_, state) => ScreenUtilInit(
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
    );
  }
}

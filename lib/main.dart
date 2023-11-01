import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:e_commerce_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart' as pc;
import 'core/localization/l10n.dart';
import 'core/presentation/manager/preference_cubit/preference_cubit.dart';
import 'core/theme/theme_data.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locater/service_locater.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();

  runApp(
    MultiBlocProvider(
      providers: const [],
      child: const MyApp(),
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
        app: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: preferenceCubit.langCode == "en" ? 'E-commerce App' : 'متجر إلكتروني',
          theme: kLightThemeData,
          locale: Locale(preferenceCubit.langCode),
          onGenerateRoute: AppRouter.generateRoute,
          supportedLocales: L10n.supportedLocales,
          localizationsDelegates: L10n.localizationsDelegates,
        ),
      ),
    );
  }
}

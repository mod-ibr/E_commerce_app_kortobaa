import 'package:flutter/material.dart';

import '../../features/auth/login.dart';
import '../../features/splashView/presentation/views/splash_view.dart';
import '../presentation/views/error_view.dart';

//Intro
const kSplashView = "/";
//Auth
const kLogInView = "/logInViewAuth";
const kRegisterView = "/registerViewAuth";

//Home
const kHomeView = "/homeView";

//Common
const kErrorView = "/errorView";

class AppRouter {
  AppRouter._();

  static Route? generateRoute(RouteSettings route) {
    switch (route.name) {
      //Intro
      case kSplashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      //Auth
      case kLogInView:
        return MaterialPageRoute(builder: (context) => const LogInViewAuth());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorView());
    }
  }
}

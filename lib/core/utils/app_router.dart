import 'package:flutter/material.dart';

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
      default:
        return MaterialPageRoute(builder: (context) => const ErrorView());
    }
  }
}

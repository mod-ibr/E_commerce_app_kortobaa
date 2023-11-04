import 'package:e_commerce_app/core/presentation/manager/preference_cubit/preference_cubit.dart';
import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/assets_images.dart';
import '../../../auth/data/models/response_login.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          onEnd: () => _onEnd(),
          child: Image.asset(
            AssetsImages.logo,
            height: 100.sh,
            width: 50.sw,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacity = 1.0;
    });
    await Future.delayed(const Duration(seconds: 1));
  }

  _onEnd() {
    // TODO : Uncomment the following code to navigate the user to the home page if he logged in previously
    final ResponseLogin? preferenceCubit = getPreferenceCubit(context).userData;
    Navigator.of(context).pushReplacementNamed(
      (preferenceCubit != null) ? kHomeView : kLogInView,
    );

    // Navigator.of(context).pushReplacementNamed(kLogInView);
  }
}

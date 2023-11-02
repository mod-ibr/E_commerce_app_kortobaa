import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets/assets_images.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          onEnd: () => Navigator.of(context).pushReplacementNamed(
            kLogInView,
          ),
          child: Image.asset(
            AssetsImages.logo,
            height: size.width * 0.6,
            width: size.width * 0.6,
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
}

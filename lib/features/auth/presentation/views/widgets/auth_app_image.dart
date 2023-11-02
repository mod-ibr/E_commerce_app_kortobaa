import 'package:flutter/material.dart';
import '../../../../../core/constants/assets/assets_images.dart';

class AppImageAuth extends StatelessWidget {
  const AppImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
      child: Image.asset(AssetsImages.login),
    );
  }
}

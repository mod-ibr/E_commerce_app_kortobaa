import 'package:flutter/material.dart';

class SliderImagesHomeView extends StatelessWidget {
  final String image;
  const SliderImagesHomeView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}

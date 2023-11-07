import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredImageHomeView extends StatelessWidget {
  final String image;
  final double height;
  final Widget child;
  const BlurredImageHomeView(
      {super.key,
      required this.image,
      required this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          image: AssetImage(image),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                color: Colors.white.withOpacity(0.60),
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}

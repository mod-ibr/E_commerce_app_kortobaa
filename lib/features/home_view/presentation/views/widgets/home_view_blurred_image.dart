import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Image.asset(
              image,
              height: height * 0.5,
              width: 1.sw,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                color: theme.colorScheme.surface.withOpacity(0.60),
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}

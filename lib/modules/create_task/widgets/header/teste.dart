import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Colors.blue, Colors.red],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

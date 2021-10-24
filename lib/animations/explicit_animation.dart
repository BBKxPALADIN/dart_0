import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key key}) : super(key: key);

  @override
  _ExplicitAnimationState createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> {
  final ufo = Image.asset('assets/ufo.png', width: 250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/milky-way.jpg',
            fit: BoxFit.cover,
          ),
          ClipPath(
            clipper: const BeamClipper(),
            child: Container(
              height: 1000,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.5,
                  colors: [
                    Colors.yellow,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          ufo,
        ],
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.width)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

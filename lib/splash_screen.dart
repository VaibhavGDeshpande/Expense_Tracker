import 'package:first/first_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _rotationAnimation;
  late final ColorTween _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14).animate(_controller);
    _colorTween = ColorTween(begin: Colors.blue, end: Colors.purple);

    _controller.forward();
    _navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => first_Screen()));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _rotationAnimation,
                child: Icon(
                  Icons.account_balance_wallet,
                  size: 100,
                  color: _colorTween.evaluate(_controller),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Expense Tracker",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.blue, Colors.green, Colors.purple],
                      tileMode: TileMode.clamp,
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

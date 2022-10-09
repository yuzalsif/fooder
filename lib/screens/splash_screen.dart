import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 3,
              height: size.height / 3,
              child: const Image(
                image: AssetImage('assets/fooderlich_asset/rw_logo.png'),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text('Initializing....'),
          ],
        ),
      ),
    );
  }
}

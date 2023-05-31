import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kahoot_localhost/app/app_setup.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final navigatorService = locator<NavigationService>();

  @override
  initState() {
    Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      navigatorService.replaceWith(Routes.splashScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weatherapp/pages/onboarding_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingPage(),
    );
  }
}

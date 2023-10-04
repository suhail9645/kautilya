import 'package:flutter/material.dart';
import 'package:kautilya/presentation/login_section/login_screen.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
      return MaterialPageRoute(builder: (context) => const LoginScreen(),);
       default:
      return MaterialPageRoute(builder: (context) => const SizedBox(),);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:kautilya/presentation/login_section/login_screen.dart';
import 'package:kautilya/presentation/otp_verification_section/otp_verification_screen.dart';
import 'package:kautilya/presentation/web_view/web_view.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
      return MaterialPageRoute(builder: (context) => const LoginScreen(),);
       case 'Submit Screen':
      return MaterialPageRoute(builder: (context) => const VerificationScreen(),);
      case 'Web Screen':
      return MaterialPageRoute(builder: (context) => const WebViewScreen(),);
       default:
      return MaterialPageRoute(builder: (context) => const SizedBox(),);
    }
  }
}
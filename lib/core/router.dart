import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kautilya/logic/loading_cubit/loading_cubit.dart';
import 'package:kautilya/presentation/login_section/login_screen.dart';
import 'package:kautilya/presentation/otp_verification_section/otp_verification_screen.dart';
import 'package:kautilya/presentation/web_view/web_view.dart';

import '../logic/counter_cubit/counter_cubit.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case 'Submit Screen':
        return MaterialPageRoute(
          builder: (context) {
              String verificationId=settings.arguments as String;
          return MultiBlocProvider(
            providers: [
               
               BlocProvider(create: (context) => CounterCubit(),)
            ],
            
            child: VerificationScreen(verificationId: verificationId,),
          );
          }
        );
      case 'Web Screen':
        return MaterialPageRoute(
          builder: (context) => WebViewScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SizedBox(),
        );
    }
  }
}

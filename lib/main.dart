import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kautilya/core/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kautilya/logic/auth_bloc/auth_cubit.dart';
import 'package:kautilya/logic/counter_cubit/counter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: AuthCubit(),
          
        ),
         
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

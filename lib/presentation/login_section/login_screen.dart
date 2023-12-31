
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kautilya/core/colors.dart';
import 'package:kautilya/logic/auth_bloc/auth_cubit.dart';
import '../../core/widgets.dart';
import '../../logic/loading_cubit/loading_cubit.dart';
import '../widget/loading_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController controller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 3, 3, 3).withOpacity(0.7),
                BlendMode.srcOver),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://i.pinimg.com/736x/2b/35/4c/2b354c52df58b66a418d14514ae244bd.jpg',
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.inika(
                      letterSpacing: 2,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor),
                ),
                spaceForHeight30,
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: GoogleFonts.k2d(
                          fontWeight: FontWeight.bold, color: kWhiteColor),
                    )
                  ],
                ),
                Form(
                  key: formkey,
                  child: TextFormField(
                    cursorColor: kWhiteColor,
                    validator: (value) {
                      return BlocProvider.of<AuthCubit>(context)
                          .validatePhoneNumber(value ?? '');
                    },
                    keyboardType: TextInputType.phone,
                    controller: controller,
                    style: const TextStyle(
                        fontSize: 16.0, height: 2.0, color: kWhiteColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kFormColor,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      hintText: 'eg: 9876543210',
                      hintStyle: GoogleFonts.ubuntu(color:Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                spaceForHeight20,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SmsCodeSentState) {
                      Navigator.pushNamed(context, 'Submit Screen',arguments: state.verificationId);
                    } else if (state is VerificatinErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return Container(
                    height: 40,
                    width: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: kWhiteColor)),
                    child: state is! LoadingState
                   ? InkWell(
                       onTap: () {
                         if (formkey.currentState!.validate()) {
                           
                                    BlocProvider.of<AuthCubit>(context)
                                        .phoneNumberSubmitedEvent(
                                            controller.text);
                                  }
                              },
                           
                            child: Center(
                                child: Text(
                              'NEXT',
                              style: GoogleFonts.k2d(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        : BlocProvider(
                            create: (context) => LoadingCubit(),
                            child: LoadingWidget(gradient: gradient),
                          ),
                  );
                    // return CircleAvatar(
                    //     radius: 30,
                    //     backgroundColor: Colors.black,
                    //     child: state is! LoadingState
                    //         ? IconButton(
                    //             onPressed: ()  {
                    //               if (formkey.currentState!.validate()) {
                    //                 BlocProvider.of<AuthCubit>(context)
                    //                     .phoneNumberSubmitedEvent(
                    //                         controller.text);
                    //               }
                    //             },
                    //             // onPressed: () {
                    //             //   BlocProvider.of<CounterCubit>(context).onDecreasingTheTime(30);
                    //             //   Navigator.pushNamed(context, 'Web Screen');
                    //             // },
                    //             icon: const Icon(
                    //               Icons.arrow_forward_ios,
                    //               color: kWhiteColor,
                    //               size: 30,
                    //             ),
                    //           )
                    //         : const CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

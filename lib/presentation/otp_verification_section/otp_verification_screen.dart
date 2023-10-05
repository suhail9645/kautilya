import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kautilya/core/colors.dart';
import 'package:kautilya/core/widgets.dart';
import 'package:kautilya/logic/auth_bloc/auth_cubit.dart';
import 'package:kautilya/logic/counter_cubit/counter_cubit.dart';
import 'package:kautilya/logic/loading_cubit/loading_cubit.dart';
import 'package:kautilya/presentation/widget/loading_widget.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key, required this.verificationId});
  final TextEditingController otpController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String verificationId;
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
                        'https://wallpapercave.com/wp/wp11612564.jpg',
                      ),
                      fit: BoxFit.fill)),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RETREIVING OTP',
                    style: GoogleFonts.ubuntu(
                        color: kWhiteColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  spaceForHeight20,
                ],
              ),
              Text(
                'ENTER VERIFICATION CODE THAT SEND TO YOUR PHONE',
                textAlign: TextAlign.center,
                style: GoogleFonts.k2d(fontSize: 18, color: Colors.grey),
              ),
              spaceForHeight20,
              Row(
                children: [
                  Text(
                    'OTP',
                    style: GoogleFonts.k2d(
                        fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
                ],
              ),
              Form(
                key: formkey,
                child: TextFormField(
                  maxLength: 6,
                  controller: otpController,
                  style: const TextStyle(
                      fontSize: 16.0, height: 2.0, color: kWhiteColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kFormColor,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    hintStyle: GoogleFonts.ubuntu(color: kWhiteColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  validator: (value) => BlocProvider.of<AuthCubit>(context)
                      .validatingOtp(value ?? ''),
                ),
              ),
              spaceForHeight20,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is OtpIncorrentState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                 if (state is VerificatinCompleteState) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "Web Screen", (route) => false);
                  }
                  if(state is TimoutState){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('OTP Timout Please Try again')));
                    Navigator.pop(context);
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
                                BlocProvider.of<AuthCubit>(context).signInEvent(
                                    otpController.text, verificationId);
                              }
                            },
                            child: Center(
                                child: Text(
                              'SUBMIT',
                              style: GoogleFonts.k2d(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            )),
                          )
                        : BlocProvider(
                            create: (context) => LoadingCubit(),
                            child: LoadingWidget(gradient: gradient),
                          ),
                  );
                },
              ),
              spaceForHeight20,
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  if (state != 0) {
                    BlocProvider.of<CounterCubit>(context)
                        .onDecreasingTheTime(state);
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.toString(),
                        style: GoogleFonts.k2d(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      spaceForWidth10,
                      
                    ],
                  );
                },
              )
            ],
          ),
        )
      ],
    ));
  }
}

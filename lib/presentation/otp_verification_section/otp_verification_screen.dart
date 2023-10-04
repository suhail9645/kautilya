import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kautilya/core/colors.dart';
import 'package:kautilya/core/widgets.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
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
              TextFormField(
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
              ),
              spaceForHeight20,
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Web Screen');
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: kWhiteColor,
                      size: 30,
                    )),
              ),
              spaceForHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '50',
                    style: GoogleFonts.k2d(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  spaceForWidth10,
                  Text(
                    'RESEND',
                    style: GoogleFonts.k2d(
                        color:const Color.fromARGB(255, 86, 84, 84),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}

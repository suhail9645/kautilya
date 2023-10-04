import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kautilya/core/colors.dart';

import '../../core/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 3, 3, 3).withOpacity(0.6),
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
                TextFormField(
                  style: const TextStyle(
                      fontSize: 16.0, height: 2.0, color: kWhiteColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kFormColor,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    hintText: 'eg: 9876543210',
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
                        Navigator.pushNamed(context, 'Submit Screen');
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: kWhiteColor,
                        size: 30,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

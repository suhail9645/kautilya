import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kautilya/core/colors.dart';

import '../../logic/loading_cubit/loading_cubit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.gradient,
  });

  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<LoadingCubit, bool>(
          builder: (context, state) {
            double position = state ? 160 : 0;
            
            BlocProvider.of<LoadingCubit>(context).changingTheValue();
           
            return Stack(
              children: [
                 Center(
                      child: Text(
                        'WAIT',
                        style: GoogleFonts.k2d(
                            fontSize: 18, fontWeight: FontWeight.w600,color: kWhiteColor),
                      ),
                    ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  right: position,
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border(
                          left: state
                              ? const BorderSide(color: Colors.white)
                              : BorderSide.none,
                          right: !state
                              ? const BorderSide(color: Colors.white)
                              : BorderSide.none),
                      gradient: LinearGradient(
                          colors: !state ? gradient.reversed.toList() : gradient),
                    ),
                  
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

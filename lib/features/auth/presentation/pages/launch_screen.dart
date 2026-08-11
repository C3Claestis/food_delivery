import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/bloc/splash/splash_cubit.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/splash/splash_state.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startSplash(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashFinished) {
            return Scaffold(
              backgroundColor: AppColors.orangebase,
              body: Padding(
                padding: const EdgeInsets.all(72.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset('assets/images/splash2.png')),
                    const SizedBox(height: 12),
                    Text(
                      "Welcome to my Apps. Food delivery from Ngawi, all food ready with one click any where you can",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.yellowbase,
                        padding: EdgeInsets.symmetric(
                          horizontal: 52,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        "Log In",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orangebase,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.yellow2,
                        padding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orangebase,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.yellowbase,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(72.0),
                child: Image.asset('assets/images/splash1.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}

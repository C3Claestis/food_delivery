import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.yellowbase,
        child: Column(
          children: [
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,                
                children: [
                  SvgPicture.asset(
                    'assets/svgs/backarrow_icon.svg',
                    width: 18,
                    height: 18,
                  ),
                  Text(
                    "Log In",
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

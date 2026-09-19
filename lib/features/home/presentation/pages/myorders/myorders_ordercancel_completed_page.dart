import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/app_colors.dart';

class MyordersOrdercancelCompletedPage extends StatelessWidget {
  const MyordersOrdercancelCompletedPage({super.key});

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
              padding: const EdgeInsets.only(left: 24),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/svgs/backarrow_icon.svg',
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 72),
            SvgPicture.asset('assets/svgs/postercancel.svg'),
            const SizedBox(height: 32),
            Text(
              "Order Cancelled!",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Your order has been successfully \n cancelled",
              style: GoogleFonts.leagueSpartan(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Text(
                  "If you have any question reach directly to our \n customer support",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

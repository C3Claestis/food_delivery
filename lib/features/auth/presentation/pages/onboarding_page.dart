import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../../bloc/onboarding/onboarding_event.dart';
import '../../../../bloc/onboarding/onboarding_state.dart';
import '../../../data/onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          final isLastPage = state.currentPage == onboardingData.length - 1;

          return PageView.builder(
            itemCount: onboardingData.length,
            controller: bloc.pageController,

            // Ketika user swipe
            onPageChanged: (index) {
              bloc.add(OnboardingPageChanged(index));
            },

            itemBuilder: (context, index) {
              final data = onboardingData[index];

              return Stack(
                children: [
                  // ============================================
                  // BACKGROUND IMAGE
                  // ============================================
                  Positioned.fill(
                    child: Image.asset(data.image, fit: BoxFit.cover),
                  ),

                  // ============================================
                  // YELLOW TOP BAR
                  // ============================================
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 48, color: AppColors.yellowbase),
                  ),

                  // ============================================
                  // BOTTOM CONTENT
                  // ============================================
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 360,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          children: [
                            const SizedBox(height: 23),

                            // ======================================
                            // ICON
                            // ======================================
                            SvgPicture.asset(data.icon, height: 36, width: 32),

                            const SizedBox(height: 22),

                            // ======================================
                            // TITLE
                            // ======================================
                            Text(
                              data.title,
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orangebase,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 19),

                            // ======================================
                            // DESCRIPTION
                            // ======================================
                            SizedBox(
                              width: 240,
                              child: Text(
                                data.description,
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            const Spacer(),

                            // ======================================
                            // PAGE INDICATOR
                            // ======================================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(onboardingData.length, (
                                indicatorIndex,
                              ) {
                                final isActive =
                                    state.currentPage == indicatorIndex;

                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: isActive ? 24 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? AppColors.orangebase
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              }),
                            ),

                            const SizedBox(height: 30),

                            TextButton(
                              onPressed: () {
                                if (isLastPage) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginPage(),
                                    ),
                                  );
                                } else {
                                  bloc.add(OnboardingNextPressed());
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.orangebase,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                              ),
                              child: Text(
                                isLastPage ? 'Get Started' : 'Next',
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

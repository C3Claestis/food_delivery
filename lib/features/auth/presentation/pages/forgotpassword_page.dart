import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/login_cubit.dart';
import '../../../../core/theme/app_colors.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
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
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/svgs/backarrow_icon.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                    Text(
                      "Set Password",
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
              const SizedBox(height: 32),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        Text(
                          "Forgot your password? No problem! Let’s get you back in so your next favorite meal isn't kept waiting.",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: 32),
                        fillText(
                          context,
                          "Password",
                          "Enter your password",
                          true,
                        ),
                        SizedBox(height: 12),
                        fillText(
                          context,
                          "Confirm Password",
                          "Enter your confirm password",
                          true,
                        ),
                        SizedBox(height: 32),
                        Center(
                          child: SizedBox(
                            width: 240,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orangebase,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    100,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Create New Password",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillText(
    BuildContext context,
    String teks,
    String hiddenTeks,
    bool isPassword,
  ) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teks,
            style: GoogleFonts.leagueSpartan(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          isPassword
              ? BlocBuilder<LoginCubit, bool>(
                  builder: (context, isObscure) {
                    return _buildTextFormField(
                      context,
                      hiddenTeks: hiddenTeks,
                      isPassword: true,
                      isObscure: isObscure,
                    );
                  },
                )
              : _buildTextFormField(
                  context,
                  hiddenTeks: hiddenTeks,
                  isPassword: false,
                  isObscure: false,
                ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(
    BuildContext context, {
    required String hiddenTeks,
    required bool isPassword,
    required bool isObscure,
  }) {
    return TextFormField(
      obscureText: isPassword ? isObscure : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        isDense:
            true, // 1. Mengunci tinggi field agar ringkas/tidak ramping melar
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12, // 2. Mengatur ketebalan/tinggi input dari dalam
        ),
        hintText: hiddenTeks,
        hintStyle: GoogleFonts.leagueSpartan(color: Colors.grey, fontSize: 14),
        // 3. Batasi ukuran suffixIcon secara langsung lewat BoxConstraints
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 40,
          maxHeight: 40,
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  context.read<LoginCubit>().togglePasswordVisibility();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    isObscure
                        ? 'assets/svgs/showoff_icon.svg'
                        : 'assets/svgs/showon_icon.svg',
                    height: 16,
                    width: 14,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            : null,
        filled: true,
        fillColor: AppColors.yellow2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

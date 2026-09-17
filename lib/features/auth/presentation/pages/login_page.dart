import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/bloc/login_cubit.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/features/auth/presentation/pages/forgotpassword_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/main_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Welcome back! Your next favorite meal, from local hidden gems to comforting classics, is just a quick sign-in away.",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: 32),
                        fillText(
                          context,
                          "Email or Mobile Number",
                          "Enter your email",
                          false,
                        ),
                        SizedBox(height: 12),
                        fillText(
                          context,
                          "Password",
                          "Enter your password",
                          true,
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              //Navigasi ke Forgot Password
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ForgotpasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.orangebase,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 48),
                        Center(
                          child: SizedBox(
                            width: 220,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => MainPage()),
                              ),
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
                                "Log In",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: Text(
                            "or sign up with",
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _btnThirdParty('assets/svgs/gmail_icon.svg', 24),
                            _btnThirdParty('assets/svgs/fb_icon.svg', 34),
                            _btnThirdParty('assets/svgs/mark_icon.svg', 34),
                          ],
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    color: AppColors.orangebase,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SignupPage(),
                                        ),
                                      );
                                    },
                                ),
                              ],
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

  Widget _btnThirdParty(String path, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        width: 48, // Lebar tombol yang kamu inginkan
        height: 48, // Tinggi tombol yang kamu inginkan
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets
                .zero, // Menghapus padding bawaan agar ikon pas di tengah
            backgroundColor: AppColors.orange2,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                18,
              ), // Gunakan BorderRadius, bukan BorderRadiusGeometry
            ),
          ),
          child: SvgPicture.asset(
            path,
            width: size, // Ukuran ikon di dalam tombol
            height: size,
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

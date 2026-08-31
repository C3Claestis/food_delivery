import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/LoginCubit.dart';
import '../../../../core/theme/app_colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                      "New Account",
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
                        fillText(
                          context,
                          "Full Name",
                          "Enter your full name",
                          InputType.text,
                        ),
                        fillText(
                          context,
                          "Password",
                          "Enter your password",
                          InputType.password,
                        ),
                        fillText(
                          context,
                          "Email",
                          "Enter your email",
                          InputType.text,
                        ),
                        fillText(
                          context,
                          "Mobile Number",
                          "Enter your phone number",
                          InputType.number,
                        ),
                        fillText(
                          context,
                          "Date of Birth",
                          "Enter your birthday",
                          InputType.date,
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "By continuing, you agree to \n",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Term of Use ",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orangebase,
                                  ),
                                ),
                                TextSpan(
                                  text: "and ",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orangebase,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: SizedBox(
                            width: 220,
                            height: 50,
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
                                "Sign Up",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            'or sign up with',
                            style: GoogleFonts.leagueSpartan(fontSize: 14),
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
                        SizedBox(height: 12),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Log in",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orangebase,
                                  ),
                                ),                              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
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
    InputType isChoose,
  ) {
    TextInputType keyboardType = TextInputType.text;

    // 1. Tentukan keyboardType berdasarkan enum InputType
    switch (isChoose) {
      case InputType.number:
        keyboardType = TextInputType.number;
        break;
      case InputType.date:
        keyboardType = TextInputType.datetime;
        break;
      case InputType.password:
        keyboardType = TextInputType.visiblePassword;
        break;
      case InputType.text:
        keyboardType = TextInputType.text;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
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
            (isChoose == InputType.password)
                ? BlocBuilder<LoginCubit, bool>(
                    builder: (context, isObscure) {
                      return _buildTextFormField(
                        context,
                        hiddenTeks: hiddenTeks,
                        isPassword: true,
                        isObscure: isObscure,
                        keyboardType:
                            keyboardType, // 2. Pass keyboardType ke fungsi
                      );
                    },
                  )
                : _buildTextFormField(
                    context,
                    hiddenTeks: hiddenTeks,
                    isPassword: false,
                    isObscure: false,
                    keyboardType:
                        keyboardType, // 2. Pass keyboardType ke fungsi
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    BuildContext context, {
    required String hiddenTeks,
    required bool isPassword,
    required bool isObscure,
    required TextInputType keyboardType, // 3. Terima parameter keyboardType
  }) {
    return TextFormField(
      keyboardType: keyboardType, // 4. Pasang ke TextFormField di sini
      obscureText: isPassword ? isObscure : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: hiddenTeks,
        hintStyle: GoogleFonts.leagueSpartan(color: Colors.grey, fontSize: 14),
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

enum InputType { text, password, number, date }

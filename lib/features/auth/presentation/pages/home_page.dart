import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Catatan: Gunakan Stateful/Hooks/Controller dari Parent agar controller
    // tidak ter-recreate tiap build saat diintegrasikan dengan Dio nantinya.
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.yellowbase,
        child: Column(
          children: [
            const SizedBox(height: 52),

            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  // Search Bar mengambil sisa ruang kiri
                  Expanded(
                    child: searchBar(
                      controller: _searchController,
                      hintText: "Search",
                      onSearchTap: () {
                        // Action filter/search
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Tempat 3 Tombol di Kanan Search Bar
                  _buildHeaderButton(
                    iconPath: 'assets/svgs/cart_icon.svg',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderButton(
                    iconPath: 'assets/svgs/notification_icon.svg',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderButton(
                    iconPath: 'assets/svgs/user_icon.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Good Morning",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "Rise And Shine! It's Breakfeast Time",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.orangebase,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Content Area Bottom Sheet
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(24),
                    topEnd: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(child: Column(children: [])),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Tombol-Tombol Kanan
  Widget _buildHeaderButton({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }

  // Widget SearchBar yang Sudah Diperbaiki
  Widget searchBar({
    required TextEditingController controller,
    required String hintText,
    VoidCallback? onSearchTap,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      height: 44, // Disesuaikan dari 32 ke 44 agar muat dengan TextField & Icon
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.leagueSpartan(fontSize: 15, color: Colors.black87),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          hintStyle: GoogleFonts.leagueSpartan(
            color: Colors.grey,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.only(left: 16, right: 8),
          border: InputBorder.none,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 36,
            maxWidth: 36,
          ),
          suffixIcon: GestureDetector(
            onTap: onSearchTap,
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.orangebase,
              ),
              child: SvgPicture.asset(
                'assets/svgs/filters_icon.svg',
                width: 16,
                height: 16,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

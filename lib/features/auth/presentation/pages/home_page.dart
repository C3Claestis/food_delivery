import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.yellowbase,
        child: Column(
          children: [
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                child: searchBar(
                  controller: _searchController,
                  hintText: "Search",
                ),
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
                child: SingleChildScrollView(child: Column(children:[
        
                ] ,
              )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar({
    required TextEditingController controller,
    required String hintText,
    VoidCallback? onSearchTap,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.leagueSpartan(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.leagueSpartan(
            color: Colors.grey,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: InputBorder.none, // Menghapus garis tepi default
          // Icon di sebelah kanan
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 48,
            maxHeight: 48,
          ),
          suffixIcon: GestureDetector(
            onTap: onSearchTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(                
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.orangebase,
                ),
                child: SvgPicture.asset(
                  'assets/svgs/filters_icon.svg', // atau gunakan Icon(Icons.search)
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

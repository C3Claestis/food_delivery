import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width:
          MediaQuery.of(context).size.width *
          0.75, // Ukuran lebar drawer (75% layar)
      backgroundColor:
          Colors.transparent, // Transparan agar efek radius terlihat
      elevation: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36),
          bottomLeft: Radius.circular(36),
        ),
        child: Container(
          color: const Color(0xFFE55325), // Warna oranye utama
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HEADER PROFILE (Foto + Nama + Email)
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      'assets/images/Chisa.jpeg',
                    ), // Ganti dengan foto kamu
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Smith",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.font2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Loremipsum@email.com",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.yellow2,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 2. DAFTAR MENU DRAWER
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildMenuItem(
                      icon: "assets/svgs/bag_icon.svg",
                      title: "My Orders",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/user_icon.svg",
                      title: "My Profile",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/pinlocation_icon.svg",
                      title: "Delivery Address",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/card_icon.svg",
                      title: "Payment Methods",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/callOn_icon.svg",
                      title: "Contact Us",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/textglobe_icon.svg",
                      title: "Help & FAQs",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/setting_icon.svg",
                      title: "Settings",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: "assets/svgs/logout_icon.svg",
                      title: "Log Out",
                      showDivider: false, // Menu terakhir tanpa garis pemisah
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk Item Menu
  Widget _buildMenuItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: Container(
            padding: EdgeInsets.all(8),
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(icon),
          ),
          title: Text(
            title,
            style: GoogleFonts.leagueSpartan(
              color: AppColors.yellow2,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            color: Colors.white30, // Garis putih tipis transparan
            height: 16,
            thickness: 0.8,
          ),
      ],
    );
  }
}

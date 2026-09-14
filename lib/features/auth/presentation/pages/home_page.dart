import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/bloc/carousel_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Catatan: Gunakan Stateful/Hooks/Controller dari Parent agar controller
    // tidak ter-recreate tiap build saat diintegrasikan dengan Dio nantinya.
    final TextEditingController _searchController = TextEditingController();

    final List<Widget> banners = [_carousel1(), _carousel2(), _carousel3()];

    return BlocProvider(
      create: (context) => CarouselCubit(),
      child: Scaffold(
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
                      height: 1,
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          //Head Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _botMenu(
                                path: "assets/svgs/snacks.svg",
                                name: "Snacks",
                              ),
                              _botMenu(
                                path: "assets/svgs/meals.svg",
                                name: "Meal",
                              ),
                              _botMenu(
                                path: "assets/svgs/vegan.svg",
                                name: "Vegan",
                              ),
                              _botMenu(
                                path: "assets/svgs/desserts.svg",
                                name: "Dessert",
                              ),
                              _botMenu(
                                path: "assets/svgs/drinks.svg",
                                name: "Drinks",
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(thickness: 2, color: AppColors.orange2),

                          //Best Seller Window
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Best Seller",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets
                                      .zero, // Menghilangkan padding bawaan tombol
                                  minimumSize: Size
                                      .zero, // Menghilangkan ukuran minimum bawaan tombol
                                  tapTargetSize: MaterialTapTargetSize
                                      .shrinkWrap, // Agar area klik tidak melebar
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, // Agar ukuran tombol pas sesuai isi
                                  children: [
                                    Text(
                                      'View All',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.orangebase,
                                        height: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ), // Jarak antara teks dan ikon
                                    SvgPicture.asset(
                                      'assets/svgs/next_icon.svg',
                                      fit: BoxFit.contain,
                                    ), // Ganti dengan ikonmu
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _itemBestSeller(
                                path: 'assets/images/food-1.png',
                                nilai: 130.0,
                              ),
                              _itemBestSeller(
                                path: 'assets/images/food-2.png',
                                nilai: 30.12,
                              ),
                              _itemBestSeller(
                                path: 'assets/images/food-3.png',
                                nilai: 12.99,
                              ),
                              _itemBestSeller(
                                path: 'assets/images/food-4.png',
                                nilai: 8.42,
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Builder(
                            builder: (context) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 140,
                                    child: PageView.builder(
                                      itemCount: banners.length,
                                      onPageChanged: (index) {
                                        // Panggil Cubit saat halaman digeser
                                        context
                                            .read<CarouselCubit>()
                                            .changePage(index);
                                      },
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0,
                                          ),
                                          child: banners[index],
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                          
                                  // Rebuild hanya bagian Dots Indicator menggunakan BlocBuilder
                                  BlocBuilder<CarouselCubit, int>(
                                    builder: (context, currentIndex) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          banners.length,
                                          (index) => AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            margin:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                ),
                                            width: currentIndex == index
                                                ? 16
                                                : 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: currentIndex == index
                                                  ? const Color(0xFFE55325)
                                                  : Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
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

  //Carousel
  Widget _carousel1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SISI KIRI: Background Gelap + Teks CTA
          Expanded(
            flex: 6,
            child: Container(
              color: const Color(0xFF1E1E1E),
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "LIMITED OFFER",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Free Delivery",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "On all orders over \$25",
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SISI KANAN: Gambar
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/photo_pizza.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Gambar Latar Belakang Penuh
          Positioned.fill(
            child: Image.asset(
              'assets/images/photo_pizza.png',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Gradasi Transparan dari Kiri ke Kanan
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Konten Teks di Atas Gradient
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chef's Special",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Italian Pepperoni",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE55325),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel3() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.orangebase,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Experience our delicious new dish",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "30% OFF",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/photo_pizza.png',
                  fit: BoxFit.cover, // Menyesuaikan gambar dengan area Expanded
                ),
              ),
            ],
          ),
          // 2. DEKORASI LINGKARAN KIRI ATAS
          Positioned(
            top: -60, // Geser ke atas keluar dari area
            left: 100, // Geser ke kiri keluar dari area
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellowbase,
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangebase,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50, // Geser ke atas keluar dari area
            left: -40, // Geser ke kiri keluar dari area
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.yellowbase,
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangebase,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBestSeller({required String path, required double nilai}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 108,
          width: 72,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
        Positioned(
          right: 0,
          bottom: 15,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              color: Color(0xFFE85A31), // Warna oranye
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "\$$nilai",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _botMenu({required String path, required String name}) {
    return Column(
      children: [
        Container(
          height: 54,
          width: 42,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Color(0xffF3E9B5),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(path, fit: BoxFit.contain),
        ),
        Text(
          name,
          style: GoogleFonts.leagueSpartan(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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

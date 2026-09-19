// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/features/auth/custom_drawer.dart';
import 'package:food_delivery/features/home/presentation/pages/home_page.dart';

import '../../../../bloc/home/bottom_nav_cubit.dart';
import '../../../../core/theme/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text("Favorite Page")),
    Center(child: Text("Cart Page")),
    Center(child: Text("Profile Page")),
    Center(child: Text("Profile Page")),
    // FavoriteScreen(),
    // CartScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentIndex) {
            return IndexedStack(index: currentIndex, children: _pages);
          },
        ),
        endDrawer: CustomDrawer(),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentIndex) {
            return Container(
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.orangebase,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      context,
                      icon: 'assets/svgs/home_navbar.svg',
                      index: 0,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: 'assets/svgs/menu_navbar.svg',
                      index: 1,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: 'assets/svgs/favourite_navbar.svg',
                      index: 2,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: 'assets/svgs/list_navbar.svg',
                      index: 3,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: 'assets/svgs/cs_navbar.svg',
                      index: 4,
                      currentIndex: currentIndex,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String icon,
    required int index,
    required int currentIndex,
  }) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => context.read<BottomNavCubit>().changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.yellowbase.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.black : Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/bloc/home/segmen_cubit.dart';
import 'package:food_delivery/features/data/completed_order_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class MyordersPage extends StatelessWidget {
  const MyordersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SegmentCubit(),
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
                      "My Orders",
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
                    child: BlocBuilder<SegmentCubit, String>(
                      builder: (context, selectedChoice) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buttonHeader(
                                  context,
                                  label: "Active",
                                  selectedChoice: selectedChoice,
                                ),
                                _buttonHeader(
                                  context,
                                  label: "Completed",
                                  selectedChoice: selectedChoice,
                                ),
                                _buttonHeader(
                                  context,
                                  label: "Cancelled",
                                  selectedChoice: selectedChoice,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // 2. Konten Tengah yang Berubah Dinamis
                            _buildBodyContent(selectedChoice),
                          ],
                        );
                      },
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

  // Widget helper untuk merender konten dinamis di tengah
  Widget _buildBodyContent(String selectedChoice) {
    switch (selectedChoice) {
      case "Active":
        return Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              SvgPicture.asset('assets/svgs/transferdokumen_icon.svg'),
              const SizedBox(height: 16),
              Text(
                "You don't have any active orders at this time",
                style: GoogleFonts.leagueSpartan(
                  fontSize: 30,
                  color: AppColors.orangebase,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case "Completed":
        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),              
              itemBuilder: (context, index) {
                final order = mockCompletedOrders[index];
                return _itemCompleted(
                  path: order.path,
                  name: order.name,
                  price: order.price,
                  date: order.date,
                  items: order.items,
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(thickness: 0.5, color: AppColors.orangebase),
              itemCount: mockCompletedOrders.length,
            ),
          ],
        );
      case "Cancelled":
        return Column(
          children: const [
            Text("Daftar Pesanan yang Dibatalkan..."),
            // Gantilah dengan ListView/Card pesanan batal kamu
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _itemCompleted({
    required String path,
    required String name,
    required double price,
    required String date,
    required int items,
  }) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 108,
              width: 72,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(path, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 0.75,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "\$${price.toStringAsFixed(2)}",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.orangebase,
                          height: 0.75,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$items items",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/checklist_icon.svg',
                        height: 12,
                        width: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Order delivered',
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.orangebase,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          backgroundColor: AppColors.orangebase,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                        ),
                        child: Text(
                          "Leave a review",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          backgroundColor: AppColors.orange2,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                        ),
                        child: Text(
                          "Order again",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            color: AppColors.orangebase,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buttonHeader(
    BuildContext context, {
    required String label,
    required String selectedChoice,
  }) {
    final bool isSelected = selectedChoice == label;

    return ElevatedButton(
      onPressed: () {
        // 3. Panggil method Cubit saat tombol ditekan
        context.read<SegmentCubit>().selectChoice(label);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: isSelected ? AppColors.orangebase : AppColors.orange2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.leagueSpartan(
          fontSize: 17,
          color: isSelected ? Colors.white : AppColors.orangebase,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/features/home/presentation/pages/myorders/myorders_ordercancel_completed_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/app_colors.dart';

class MyordersCanceledPage extends StatefulWidget {
  const MyordersCanceledPage({super.key});

  @override
  State<MyordersCanceledPage> createState() => _MyordersCanceledPageState();
}

class _MyordersCanceledPageState extends State<MyordersCanceledPage> {
  // Menyimpan index alasan yang sedang dipilih (null jika belum ada yang dipilih)
  int? selectedIndex;

  // Daftar alasan pembatalan
  final List<String> reasons = [
    "Makanan tidak sesuai dengan tampilan",
    "Ingin mengubah alamat pengiriman",
    "Ingin mengubah rincian pesanan",
    "Porsi makanan terlalu sedikit",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.yellowbase,
        child: Column(
          children: [
            const SizedBox(height: 64),
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
                    "Cancel Order",
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            const SizedBox(height: 32),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Berikan alasan kenapa anda membatalkan pesanan tersebut? Silahkan pilih satu dari beberapa pilihan yang ada dibawah ini!",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: reasons.length,
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 0.5,
                            color: AppColors.orange2,
                          ),
                          itemBuilder: (context, index) {
                            final isSelected = selectedIndex == index;
                            return _item(
                              teks: reasons[index],
                              status: isSelected,
                              onTap: () {
                                setState(() {
                                  // Update index pilihan
                                  selectedIndex = index;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines:
                              4, // Menentukan tinggi box (menjadi multi-line)
                          keyboardType: TextInputType.multiline,
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: "Alasan lainnya...",
                            hintStyle: GoogleFonts.leagueSpartan(
                              fontSize: 14,
                              color: Colors.black38,
                            ),
                            fillColor: const Color(
                              0xFFF7E8B5,
                            ), // Sesuaikan dengan warna cream/kuning lembut kamu
                            filled: true,
                            contentPadding: const EdgeInsets.all(
                              16,
                            ), // Padding di dalam box
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Lengkungan sudut (rounded corner)
                              borderSide: BorderSide
                                  .none, // Menghilangkan garis border bawaan
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppColors.orangebase,
                                width: 1.5,
                              ), // Efek saat diklik
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      MyordersOrdercancelCompletedPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 48),
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
                              "Submit",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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
    );
  }

  Widget _item({
    required String teks,
    required bool status,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap, // Klik seluruh baris agar lebih responsif
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                teks,
                style: GoogleFonts.leagueSpartan(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              status
                  ? 'assets/svgs/fillpoint_icon.svg'
                  : 'assets/svgs/emptypoint_icon.svg',
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

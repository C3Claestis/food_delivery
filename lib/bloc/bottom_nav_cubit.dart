import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  // Inisialisasi state awal di index 0 (Home)
  BottomNavCubit() : super(0);

  // Fungsi untuk mengubah tab aktif
  void changeTab(int index) => emit(index);
}
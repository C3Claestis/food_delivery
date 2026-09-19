import 'package:flutter_bloc/flutter_bloc.dart';

class SegmentCubit extends Cubit<String> {
  // Nilai awal (default option)
  SegmentCubit() : super('Active');

  // Method untuk mengubah pilihan
  void selectChoice(String choice) {
    emit(choice);
  }
}
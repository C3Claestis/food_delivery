// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';

// State sederhana menampung boolean isObscure
class LoginCubit extends Cubit<bool> {
  // Initial state: true (password tersembunyi)
  LoginCubit() : super(true);

  // Method untuk toggle status password
  void togglePasswordVisibility() {
    emit(!state);
  }
}
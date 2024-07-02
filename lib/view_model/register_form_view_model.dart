import 'package:flutter/foundation.dart';
import 'package:complainz/repository/register_repository.dart';
import 'package:flutter/material.dart';

class RegisterFormViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  //final dateBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Enum? register;
  String errorMessage = '';
  bool isLoading = true;
  bool isRegister = false;

  Enum? get registerUser => register;
  String get errorMessageUser => errorMessage;
  bool get isLoadingUser => isLoading;
  bool get isRegisterUser => isRegister;

  Future<void> createRegisterUser({
    required String username,
    required String email,
    required String phone,
    //required String dateBirth,
    required String password,
    required String confirm_password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      RegisterRepository api = RegisterRepository();
      register = await api.registerUser(
        username: username,
        email: email,
        phone: phone,
        //dateBirth: dateBirth,
        password: password,
        confirm_password: confirm_password,
      );

      if (register == Type.success) {
        isRegister = true;
        isLoading = false;
        print('success');
        notifyListeners();
      } else {
        isRegister = false;
        isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      isRegister = false;
      isLoading = false;
      errorMessage = error.toString();
      print('success');
      notifyListeners();
    }
  }
}

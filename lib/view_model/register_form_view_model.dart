import 'package:complainz/view/login/login_view.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:complainz/repository/register_repository.dart';
import 'package:flutter/material.dart';

class RegisterFormViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  //final dateBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Enum? register;
  String errorMessage = '';
  bool isLoading = true;
  bool isRegister = false;

  Enum? get registerUser => register;
  String get errorMessageUser => errorMessage;
  bool get isLoadingUser => isLoading;
  bool get isRegisterUser => isRegister;

  Future<bool> registerValidator(NavigatorState navigator) async {
    if (usernameController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Username tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (emailController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Email tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (phoneController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'No handphone tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Password dan ulangi password tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    return true;
  }

  Future<void> onRegister(NavigatorState navigator) async {
    try {
      if (!(await registerValidator(navigator))) {
        cl('[onRegister].registerValidator  false');
        return;
      }

      AppDialog.showDialogProgress(navigator);

      RegisterRepository registerRepo = RegisterRepository();
      bool isSuccess = (await registerRepo.registerUser(
            username: usernameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
            confirm_password: confirmPasswordController.text,
          )) ??
          false;

      navigator.pop();

      cl('[onRegister].res = $isSuccess');

      if (isSuccess) {
        cl('[onRegister].success = $isSuccess');
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginView()),
          (Route<dynamic> route) => false,
        );
      } else {
        navigator.pop();
        cl('[onRegister].error = $isSuccess');
        AppDialog.showErrorDialog(navigator, message: isSuccess.toString());
      }
    } catch (e) {
      cl('[onRegister].error $e');
      AppDialog.showErrorDialog(navigator,
          message: 'Terjadi masalah', error: e.toString());
    }
  }
/* 
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
  } */
}


/* import 'package:complainz/widgets/app_snackbar.dart';
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

  Future<bool> registerValiator(NavigatorState navigator) async {
    if (usernameController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Username tidak boleh kosong',
        backgroundColor: Colors.red,
      );
    }
    return true;
  }

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
} */

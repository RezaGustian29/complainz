import 'package:complainz/view/login/login_view.dart';
import 'package:project/widgets/app_dialog.dart';
import 'package:project/widgets/app_snackbar.dart';
import 'package:project/widgets/console_log.dart';
import 'package:complainz/repository/register_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterFormViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
    if (!EmailValidator.validate(emailController.text)) {
      AppSnackbar.show(navigator,
          title: "Format email tidak valid",
          titleStyle: const TextStyle(fontWeight: FontWeight.w600),
          backgroundColor: Colors.red);
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
    if (passwordController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Password tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (confirmPasswordController.text.isEmpty) {
      AppSnackbar.show(
        navigator,
        title: 'Ulangi password tidak boleh kosong',
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      AppSnackbar.show(
        navigator,
        title: 'Password dan ulangi password tidak sama',
        backgroundColor: Colors.red,
      );
      return false;
    }
    return true;
  }

  Future<void> onRegister(NavigatorState navigator) async {
    try {
      if (!(await registerValidator(navigator))) {
        cl('[onRegister].registerValidator false');
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

      navigator.pop(); // Tutup dialog progress

      cl('[onRegister].res = $isSuccess');

      if (isSuccess) {
        cl('[onRegister].success = $isSuccess');

        resetForm();

        // Tampilkan notifikasi sukses
        AppSnackbar.show(
          navigator,
          title: 'Registrasi berhasil',
          backgroundColor: Colors.green,
        );

        // Tunggu sebentar agar pengguna bisa melihat notifikasi
        await Future.delayed(const Duration(seconds: 2));

        navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginView()),
          (Route<dynamic> route) => false,
        );
      } else {
        cl('[onRegister].error = $isSuccess');

        // Tampilkan notifikasi gagal
        AppSnackbar.show(
          navigator,
          title: 'Registrasi gagal. Silakan coba lagi.',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      cl('[onRegister].error $e');

      // Tutup dialog progress jika masih terbuka
      if (navigator.canPop()) {
        navigator.pop();
      }

      // Tampilkan notifikasi error
      AppSnackbar.show(
        navigator,
        title: 'Terjadi kesalahan saat registrasi',
        backgroundColor: Colors.red,
      );

      // Tampilkan dialog error dengan detail
      AppDialog.showErrorDialog(navigator,
          message: 'Terjadi masalah saat registrasi', error: e.toString());
    }
  }

  void resetForm() {
    usernameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}

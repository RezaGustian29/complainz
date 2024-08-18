import 'package:complainz/repository/login_repository.dart';
import 'package:complainz/view/bottom_navbar/bottom_navbar.dart';
import 'package:project/widgets/app_dialog.dart';
import 'package:project/widgets/app_snackbar.dart';
import 'package:project/widgets/console_log.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginFormViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> onLogin(NavigatorState navigator, BuildContext context) async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong',
          titleStyle: const TextStyle(fontWeight: FontWeight.w600),
          backgroundColor: Colors.red);

      return;
    }

    //email validator
    if (!EmailValidator.validate(usernameController.text)) {
      AppSnackbar.show(navigator,
          title: "Format email tidak valid",
          titleStyle: const TextStyle(fontWeight: FontWeight.w600),
          backgroundColor: Colors.red);
      return;
    }

    AppDialog.showDialogProgress(navigator);

    try {
      LoginRepository loginRepo = LoginRepository();
      var res = await loginRepo.userLogin(
        usernameEmail: usernameController.text,
        password: passwordController.text,
      );

      // ignore: unnecessary_null_comparison
      if (res == null) {
        // ignore: use_build_context_synchronously
        navigator.pop();
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavbar()),
          (Route<dynamic> route) => false,
        );
      } else {
        cl('[onLogin].error = login failed');
        navigator.pop();
        AppSnackbar.show(navigator,
            title: 'Username atau password salah', backgroundColor: Colors.red);
        /* AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah'); */
      }
    } catch (e) {
      cl('[onLogin].error: $e');
      AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString());
    }
  }
}

import 'package:complainz/repository/login_repository.dart';
import 'package:complainz/view/bottom_navbar/bottom_navbar.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> onLogin(NavigatorState navigator, BuildContext context) async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong');

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
        AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah');
      }
    } catch (e) {
      cl('[onLogin].error: $e');
      AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString());
    }
  }
}


/* import 'package:complainz/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginFormViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginStatus? _login;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isLogin = false;
  LoginStatus? get login => _login;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isLogin => _isLogin;

  Future<void> onLogin({
    required String username,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      LoginRepository login = LoginRepository();
      _login =
          await login.userLogin(usernameEmail: username, password: password);
      if (_login == LoginStatus.success) {
        _isLogin = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isLogin = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isLoading = false;
      _isLogin = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
} */

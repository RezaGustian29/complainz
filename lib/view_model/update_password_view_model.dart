import 'package:complainz/repository/update_password_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdatePasswordViewModel extends ChangeNotifier {
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
/* 
  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    dateBirthController.dispose();
    super.dispose();
  } */

  Future<void> updateUserPass(
      NavigatorState navigator, BuildContext context) async {
    /*  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong');

      return;
    } */

    AppDialog.showDialogProgress(navigator);

    try {
      UpdatePassRepository updateUser = UpdatePassRepository();
      var res = await updateUser.updatePassUser(
        oldPassword: "111111",
        newPassword: "Agu111",
      );

      if (res == null) {
        cl('[updateUser].error = login failed');

        navigator.pop();
      } else {
        cl('[updateUser].updateMessage = Update success');
        // Kosongkan form setelah update berhasil
        /* usernameController.clear();
        phoneController.clear();
        dateBirthController.clear(); */

        navigator.pop();
        /* AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah'); */
      }
    } catch (e) {
      cl('[updateUser].error: $e');
      /* AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString()); */
    }
  }
}

/* import 'package:complainz/repository/update_password_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdatePassViewModel extends ChangeNotifier {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }

  Future<void> updatePass(
      NavigatorState navigator, BuildContext context) async {
    /*  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong');

      return;
    } */

    AppDialog.showDialogProgress(navigator);

    try {
      UpdatePassRepository updateUserPass = UpdatePassRepository();
      var res = await updateUserPass.updatePassword(
        oldPassword: "Aku123",
        newPassword: "Agu111",
      );
      if (res == null) {
        cl('[updateUser].error = login failed');

        navigator.pop();
      } else {
        print(res);
        cl('[updateUser].updateMessage = Update success');
        // Kosongkan form setelah update berhasil

        navigator.pop();
        /* AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah'); */
      }
    } catch (e) {
      cl('[updateUser].error: $e');
      /* AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString()); */
    }
  }
} */



/* import 'package:complainz/repository/update_profile_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    dateBirthController.dispose();
    super.dispose();
  }

  Future<void> updateUser(
      NavigatorState navigator, BuildContext context) async {
    /*  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong');

      return;
    } */

    AppDialog.showDialogProgress(navigator);

    try {
      UpdateProfileRepository updateUser = UpdateProfileRepository();
      var res = await updateUser.updateProfile(
        username: usernameController.text,
        phone: phoneController.text,
        dateBirth: phoneController.text,
      );

      if (res == null) {
        cl('[updateUser].error = login failed');

        navigator.pop();
      } else {
        cl('[updateUser].updateMessage = Update success');

        navigator.pop();
        /* AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah'); */
      }
    } catch (e) {
      cl('[updateUser].error: $e');
      /* AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString()); */
    }
  }
}
 */

/* import 'package:complainz/repository/update_password_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdatePasswordViewModel extends ChangeNotifier {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }

  Future<void> updatePass(
      NavigatorState navigator, BuildContext context) async {
    /*  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.show(navigator,
          title: 'Username atau password tidak boleh kosong');

      return;
    } */

    AppDialog.showDialogProgress(navigator);
    print(oldPassController.text);
    print(newPassController.text);

    try {
      UpdatePasswordRepository updatePass = UpdatePasswordRepository();
      var res = await updatePass.updatePassword(
        OldPassword: oldPassController.text,
        NewPassword: newPassController.text,
      );

      if (res == null) {
        cl('[updatePass].error = login failed');

        navigator.pop();
      } else {
        cl('[updatePass].updateMessage = Update success');
        // Kosongkan form setelah update berhasil
        oldPassController.clear();
        newPassController.clear();

        navigator.pop();
        /* AppDialog.showErrorDialog(navigator,
            title: 'Oops', message: 'Username atau password Salah'); */
      }
    } catch (e) {
      cl('[updatePass].error: $e');
      /* AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString()); */
    }
  }
} */

/* import 'package:complainz/repository/update_password_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdatePasswordViewModel extends ChangeNotifier {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }

  Future<void> updatePass(
      NavigatorState navigator, BuildContext context) async {
    AppDialog.showDialogProgress(navigator);
    print(oldPassController.text);
    print(newPassController.text);

    try {
      UpdatePasswordRepository updatePass = UpdatePasswordRepository();
      var res = await updatePass.updatePassword(
        OldPassword: oldPassController.text,
        NewPassword: newPassController.text,
      );

      navigator.pop();
      if (res == null) {
        cl('[updatePass].updateMessage = Update success');
        oldPassController.clear();
        newPassController.clear();
      } else {
        cl('[updatePass].error = $res');
        AppDialog.showErrorDialog(navigator, title: 'Oops', message: res);
      }
    } catch (e) {
      cl('[updatePass].error: $e');
      AppDialog.showErrorDialog(navigator,
          message: "Terjadi Masalah", error: e.toString());
    }
  }
}
 */
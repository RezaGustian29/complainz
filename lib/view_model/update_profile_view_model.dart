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

import 'package:complainz/repository/update_profile_repository.dart';
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
        dateBirth: dateBirthController.text,
      );

      if (res == null) {
        cl('[updateUser].error = login failed');

        navigator.pop();
      } else {
        cl('[updateUser].updateMessage = Update success');
        // Kosongkan form setelah update berhasil
        usernameController.clear();
        phoneController.clear();
        dateBirthController.clear();

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

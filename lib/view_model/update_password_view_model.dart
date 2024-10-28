import 'package:complainz/repository/update_password_repository.dart';
import 'package:project/widgets/app_dialog.dart';
import 'package:project/widgets/console_log.dart';
import 'package:flutter/material.dart';

class UpdatePasswordViewModel extends ChangeNotifier {
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();

  Future<void> updateUserPass(
      NavigatorState navigator, BuildContext context) async {
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

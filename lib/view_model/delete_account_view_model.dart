import 'package:complainz/repository/delete_account_repository.dart';
import 'package:project/widgets/console_log.dart';
import 'package:flutter/material.dart';

class DeleteAccountViewModel extends ChangeNotifier {
  Future<String> deleteUser() async {
    try {
      notifyListeners();
      DeleteAccountRepository api = DeleteAccountRepository();
      final result = await api.deleteUser();
      cl('[deleteUser].status: $result');
      notifyListeners();
      return result ?? 'Unknown error';
    } catch (e) {
      cl('[deleteUser].error: $e');
      return e.toString();
    }
  }
}

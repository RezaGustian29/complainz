import 'package:complainz/repository/delete_account_repository.dart';
import 'package:complainz/widgets/console_log.dart';
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


/* import 'package:complainz/repository/delete_account_repository.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class DeleteAccountViewModel extends ChangeNotifier {

  
  
  Future<void> getResultUserProfile() async {
    try {
      notifyListeners();
      DeleteAccountRepository api = DeleteAccountRepository();
      final delete = await api.deleteUser();
      cl('[getUserProfile].status: $api');
      notifyListeners();
    } catch (e) {
      cl('[getUserProfile].error: $e');
    }
  }
} */
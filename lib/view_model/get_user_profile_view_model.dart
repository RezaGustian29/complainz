import 'package:complainz/model/get_user_profile_model.dart';
import 'package:complainz/repository/get_user_profile_repository.dart';
import 'package:project/widgets/console_log.dart';
import 'package:flutter/material.dart';

class GetUserProfileViewModel extends ChangeNotifier {
  GetUserProfileModel? _userProfile;
  GetUserProfileModel? get userProfile => _userProfile;

  Future<void> getResultUserProfile() async {
    try {
      notifyListeners();
      GetUserProfileRepository api = GetUserProfileRepository();
      _userProfile = await api.getUserProfile();
      cl('[getUserProfile].status: $api');
      notifyListeners();
    } catch (e) {
      cl('[getUserProfile].error: $e');
    }
  }
}

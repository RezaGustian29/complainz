import 'package:complainz/model/get_user_profile_model.dart';
import 'package:complainz/repository/get_user_profile_repository.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class GetUserProfileViewModel extends ChangeNotifier {
  /* GetUserProfileModel? _userProfile;
  GetUserProfileModel? get userProfile => _userProfile; */

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

/* class GetUserProfileViewModel extends ChangeNotifier {
  List<GetUserProfileModel> _userProfile = [];
  List<GetUserProfileModel> get userProfile => _userProfile;

  Future<void> getResultUserProfile({
    required int id,
    /*  required String photo_profile,
    required String full_name,
    required int laporan,
    required int pending,
    required int proccess,
    required int resolved, */
  }) async {
    try {
      GetUserProfileRepository api = GetUserProfileRepository();
      _userProfile = await api.getUserProfile(
        id: id,
        /* photo_profile: photo_profile,
        full_name: full_name,
        laporan: laporan,
        pending: pending,
        proccess: proccess,
        resolved: resolved, */
      );
      cl('[getUserProfile].status: $api');
      notifyListeners();
    } catch (e) {
      cl('[getUserProfile].error: $e');
    }
  }
} */

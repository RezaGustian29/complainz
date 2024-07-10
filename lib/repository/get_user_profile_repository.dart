import 'package:complainz/config/app_url.dart';
import 'package:complainz/model/get_user_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserProfileRepository {
  Dio dio = Dio();

  Future<GetUserProfileModel> getUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      print(getToken);
      var response = await dio.get(
        AppUrl.getUserProfile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        GetUserProfileModel userProfile =
            GetUserProfileModel.fromJson(response.data["user"]);
        return userProfile;

        /* List<GetUserProfileModel> user = (response.data['user'] as List)
            .map((e) => GetUserProfileModel.fromJson(e))
            .toList(); */
        //return user;
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

/* class GetUserProfileRepository {
  Dio dio = Dio();

  Future<List<GetUserProfileModel>> getUserProfile({
    required int id,
    /*  required String photo_profile,
    required String full_name,
    required int laporan,
    required int pending,
    required int proccess,
    required int resolved, */
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get(AppUrl.getUserProfile,
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        List<GetUserProfileModel> userProfile = List<GetUserProfileModel>.from(
            response.data["user"]
                .map((e) => GetUserProfileModel.fromJson(e))).toList();
        return userProfile;
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
} */

import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileRepository {
  Dio dio = Dio();

  Future<String?> updateProfile({
    String? username,
    String? phone,
    String? dateBirth,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      int? getId = prefs.getInt('idUser');
      prefs.containsKey('token');
      final response = await dio.put(
        "${AppUrl.updateUserProfile}/$getId",
        data: {
          "Username": username,
          "Phone": phone,
          "DateBirth": dateBirth,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['user']['token']);
        cl('[updateUser].success = $response');
        return null; // Login berhasil
      } else {
        cl('[updateUser].error = $response');
        return response.toString();
      }
    } catch (e) {
      cl('[updateUser].error = $e');
      return e.toString();
    }
  }
}

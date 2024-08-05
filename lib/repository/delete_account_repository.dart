import 'package:complainz/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountRepository {
  Dio dio = Dio();

  Future<String?> deleteUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');

      if (getToken == null) {
        return 'Token not found';
      }

      var response = await dio.delete(
        AppUrl.deleteUser,
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Handle the response as needed
        return 'User deleted successfully';
      } else {
        return 'Failed to delete user';
      }
    } on DioException catch (e) {
      return 'Error: ${e.toString()}';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}


/* import 'package:complainz/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountRepository {
  Dio dio = Dio();

  Future<String?> deleteUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get(
        AppUrl.deleteUser,
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response);
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
    return null;
  }
}
 */
import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  Dio dio = Dio();

  Future<String?> userLogin({
    required String usernameEmail,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        AppUrl.login,
        data: {
          "username_or_email": usernameEmail,
          "password": password,
        },
        options: Options(
          contentType: 'application/json; charset=UTF-8',
        ),
      );

      if (response.statusCode == 200) {
        cl('[onLogin].success = $response');
        return null; // Login berhasil
      } else {
        cl('[onLogin].error = $response');
        return response.toString();
      }
    } catch (e) {
      cl('[onLogin].error = $e');
      return e.toString();
    }
  }
}





/* import 'package:complainz/config/app_url.dart';
import 'package:dio/dio.dart';

enum LoginStatus { success, failed }

class LoginRepository {
  Dio dio = Dio();

  Future<LoginStatus> userLogin({
    required String usernameEmail,
    required String password,
  }) async {
    dynamic data = {
      "username_or_email": usernameEmail,
      "password": password,
    };
    try {
      var response = await dio.post(
        AppUrl.login,
        data: data,
        options: Options(
          headers: {
            "Content-type": 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        return LoginStatus.success;
      } else {
        return LoginStatus.failed;
      }
    } on DioException {
      return LoginStatus.failed;
    }
  }
}
 */
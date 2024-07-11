import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';

enum Type { success, fail }

class RegisterRepository {
  Dio dio = Dio();

  Future<bool?> registerUser({
    required String username,
    required String email,
    required String phone,
    //required String dateBirth,
    required String password,
    // ignore: non_constant_identifier_names
    required String confirm_password,
  }) async {
    try {
      final response = await dio.post(
        AppUrl.register,
        data: {
          "username": username,
          "email": email,
          "phone": phone,
          //"dateBirth": dateBirth,
          "password": password,
          "confirm_password": confirm_password,
        },
        options: Options(contentType: 'application/json; charset=UTF-8'),
      );
      if (response.statusCode == 200) {
        cl('[registerUser].success = $response');
        return true;
        //return null;
      } else {
        cl('[registerUser].error = $response');
        return false;
        //return response.toString();
      }
    } catch (e) {
      cl('[registerUser].error = $e');
      return false;
      //return e.toString();
    }
  }
}

/* import 'package:complainz/config/app_url.dart';
import 'package:dio/dio.dart';

enum Type { success, fail }

class RegisterRepository {
  Dio dio = Dio();

  Future registerUser({
    required String username,
    required String email,
    required String phone,
    //required String dateBirth,
    required String password,
    required String confirm_password,
  }) async {
    try {
      var response = await dio.post("${AppUrl.baseUrl}/register/user",
          data: {
            "username": username,
            "email": email,
            "phone": phone,
            //"dateBirth": dateBirth,
            "password": password,
            "confirm_password": confirm_password,
          },
          options: Options(headers: {
            'Content-type': 'application/json; charset=UTF-8',
          }));

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.data);
        return Type.success;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
} */

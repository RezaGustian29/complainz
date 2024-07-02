import 'package:complainz/config/app_url.dart';
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
}

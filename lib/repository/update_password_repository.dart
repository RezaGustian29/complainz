import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePassRepository {
  Dio dio = Dio();

  Future<String?> updatePassUser({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');

      // Log untuk token
      if (getToken != null) {
        cl('Token retrieved: $getToken');
      } else {
        cl('No token found');
      }

      // Log untuk data yang dikirim
      cl('Data sent: OldPassword: $oldPassword, NewPassword: $newPassword');

      final response = await dio.put(
        AppUrl.updatePass,
        data: {
          "OldPassword": oldPassword,
          "NewPassword": newPassword,
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
        return null; // Update berhasil
      } else {
        cl('[updateUser].error = $response');
        return response.toString();
      }
    } catch (e) {
      if (e is DioException) {
        cl('[updateUser].error = DioException: ${e.response?.data}');
      } else {
        cl('[updateUser].error = $e');
      }
      return e.toString();
    }
  }
}



/* import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePassRepository {
  Dio dio = Dio();

  Future<String?> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      /* if (getToken == null) {
        cl('[updateUser].error = Token tidak ditemukan');
        return 'Token tidak ditemukan';
      } */

      /* if (OldPassword == null || OldPassword.isEmpty) {
        cl('[updateUser].error = Password lama tidak boleh kosong');
        return 'Password lama tidak boleh kosong';
      } */
/* 
      if (NewPassword == null || NewPassword.isEmpty) {
        cl('[updateUser].error = Password baru tidak boleh kosong');
        return 'Password baru tidak boleh kosong';
      } */

      final response = await dio.put(
        AppUrl.updatePass,
        data: {
          "OldPassword": oldPassword,
          "NewPassword": newPassword,
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
        return null; // Update berhasil
      } else {
        cl('[updateUser].error = ${response.data}');
        return response.data.toString();
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          cl('[updateUser].error = ${e.response?.data}');
          return e.response?.data.toString();
        } else {
          cl('[updateUser].error = ${e.message}');
          return e.message;
        }
      } else {
        cl('[updateUser].error = $e');
        return e.toString();
      }
    }
  }
} */




/* import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePasswordRepository {
  Dio dio = Dio();

  Future<String?> updatePassword({
    required String OldPassword,
    required String NewPassword,
  }) async {
    print(OldPassword);
    print(NewPassword);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      //int? getId = prefs.getInt('idUser');
      prefs.containsKey('token');
      final response = await dio.put(
        AppUrl.updatePass,
        data: {
          "OldPassword": OldPassword,
          "NewPassword": NewPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        cl('[updatePass].success = $response');
        return null; // Login berhasil
      } else {
        cl('[updatePass].error = $response');
        return response.toString();
      }
    } catch (e) {
      cl('[updatePass].error = $e');
      return e.toString();
    }
  }
}
 */

/* import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePasswordRepository {
  Dio dio = Dio();

  UpdatePasswordRepository() {
    dio.options.validateStatus = (status) {
      return status! < 500; // Allow responses with status code less than 500
    };
  }

  Future<String?> updatePassword({
    required String OldPassword,
    required String NewPassword,
  }) async {
    print('Old Password: $OldPassword');
    print('New Password: $NewPassword');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');

      // Log token
      print('Token: $getToken');

      final response = await dio.put(
        AppUrl.updatePass,
        data: {
          "OldPassword": OldPassword,
          "NewPassword": NewPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      // Log full request and response details
      print('Request URL: ${response.requestOptions.uri}');
      print('Request data: ${response.requestOptions.data}');
      print('Request headers: ${response.requestOptions.headers}');
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        cl('[updatePass].success = ${response.data}');
        return null; // Update successful
      } else {
        cl('[updatePass].error = ${response.data}');
        return response.data.toString();
      }
    } catch (e) {
      cl('[updatePass].error = $e');
      return e.toString();
    }
  }
}
 */
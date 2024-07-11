import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReportRepository {
  Dio dio = Dio();

  Future<bool?> createReport({
    required String type,
    // ignore: non_constant_identifier_names
    required int category_id,
    // ignore: non_constant_identifier_names
    // ignore: non_constant_identifier_names
    required String photo_url,
    // ignore: non_constant_identifier_names
    required String video_url,
    required String description,
    // ignore: non_constant_identifier_names
    required bool is_public,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.post("${AppUrl.baseUrl}/complaintz/complaint",
          data: {
            "type": type,
            "category_id": category_id,
            "photo_url": photo_url,
            "video_url": video_url,
            "description": description,
            "is_public": is_public,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        cl('[createReport].success = $response');
        return true;
      } else {
        cl('[createReport].error = $response');
        return false;
      }
    } catch (e) {
      cl('[createReport].error $e');
      return false;
      //
    }
  }
}

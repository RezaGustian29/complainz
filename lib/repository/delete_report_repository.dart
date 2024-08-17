import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

enum Type { deleted, fail }

class DeleteReportRepository {
  Dio dio = Dio();

  Future deleteComplaintId({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response =
          await dio.delete("${AppUrl.baseUrl}/complaintz/complaint/$id",
              options: Options(headers: {
                'Authorization': 'Bearer $getToken',
                'Content-type': 'application/json; charset=UTF-8',
              }));

      if (response.statusCode == 200) {
        return Type.deleted;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
}

/* import 'package:complainz/config/app_url.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteReportRepository {
  final Dio dio = Dio();

  Future<String?> deleteReport({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');

      if (getToken == null) {
        return 'Token not found';
      }

      var response = await dio.delete(
        "${AppUrl.baseUrl}/complaintz/complaint/$id",
        options: Options(headers: {
          'Authorization': 'Bearer $getToken',
          'Content-type': 'application/json; charset=UTF-8',
        }),
      );

      if (response.statusCode == 200) {
        cl('[deleteReport].success = ${response.data}');
        return null; // Deletion successful
      } else {
        cl('[deleteReport].error = ${response.statusCode}: ${response.data}');
        return 'Failed to delete report: ${response.statusCode}';
      }
    } catch (e) {
      cl('[deleteReport].error = $e');
      return 'Error deleting report: $e';
    }
  }
}
 */
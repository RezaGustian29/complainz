import 'package:complainz/config/app_url.dart';
import 'package:complainz/model/get_report_status_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetReportStatusRepository {
  Dio dio = Dio();

  Future<List<GetReportStatusModel>> getReportStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get(
        "${AppUrl.getReportStatus}All",
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<GetReportStatusModel> complaintStatus =
            List<GetReportStatusModel>.from(response.data["complaints"]
                .map((e) => GetReportStatusModel.fromJson(e))).toList();
        return complaintStatus;
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

import 'package:complainz/config/app_url.dart';
import 'package:complainz/model/get_all_report_model.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllReportRepository {
  Dio dio = Dio();

  Future<List<GetAllReportModel>> getAllReporttt(
      {required String category, required String sort}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      final response = await dio.get(
        "${AppUrl.getAllReport}/$category",
        queryParameters: {
          "sort": sort,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        cl('[getAllReport].success = $response');
        //List<GetAllReportModel> complaint = List<GetAllReportModel>.from(response.data['complaints'].map((e) => GetAllReportModel.fromJson(e)).toList);
        List<GetAllReportModel> complaints =
            (response.data['complaints'] as List)
                .map((e) => GetAllReportModel.fromJson(e))
                .toList();
        return complaints;
      } else {
        cl('[getAllReport].error = $response');
        return [];
      }
    } catch (e) {
      cl('[getAllReport].error = $e');
      return [];
    }
  }
}

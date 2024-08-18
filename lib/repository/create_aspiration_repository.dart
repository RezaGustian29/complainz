import 'package:complainz/config/app_url.dart';
import 'package:complainz/model/create_aspiration_model.dart';
import 'package:project/widgets/console_log.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAspirationRepository {
  Dio dio = Dio();

  Future<bool?> createAspiration({
    required String type,
    // ignore: non_constant_identifier_names
    required int category_id,
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
          data: CreateAspirationModel(
            type: type,
            categoryId: category_id,
            photoUrl: photo_url,
            videoUrl: video_url,
            description: description,
            isPublic: is_public,
          ),
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        cl('[createAspiration].success = $response');
        return true;
      } else {
        cl('[createAspiration].error = $response');
        return false;
      }
    } catch (e) {
      cl('[createAspiration].error $e');
      return false;
      //
    }
  }
}

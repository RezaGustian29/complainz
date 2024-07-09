import 'package:complainz/model/get_report_status_model.dart';
import 'package:complainz/repository/get_report_status_repository.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class GetReportStatusViewModel extends ChangeNotifier {
  List<GetReportStatusModel> _reportStatus = [];
  List<GetReportStatusModel> get reportStatus => _reportStatus;

  Future<void> getResultReportStatus({required String status}) async {
    try {
      GetReportStatusRepository api = GetReportStatusRepository();
      _reportStatus = await api.getReportStatus(status: status);
      cl('[getStatus].status: $api');
      notifyListeners();
    } catch (e) {
      cl('[getStatus].error: $e');
    }
  }
}

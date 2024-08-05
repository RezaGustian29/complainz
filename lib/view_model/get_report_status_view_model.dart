/* import 'package:complainz/model/get_report_status_model.dart';
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
 */

import 'package:complainz/model/get_report_status_model.dart';
import 'package:complainz/repository/get_report_status_repository.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class GetReportStatusViewModel extends ChangeNotifier {
  List<GetReportStatusModel> _reportStatus = [];
  List<GetReportStatusModel> _filteredReportStatus = [];
  List<GetReportStatusModel> get filteredReportStatus => _filteredReportStatus;

  Future<void> getResultReportStatus({required String status}) async {
    try {
      GetReportStatusRepository api = GetReportStatusRepository();
      _reportStatus = await api.getReportStatus();
      cl('[getStatus].status: $api');
      filterReportStatus(status);
      notifyListeners();
    } catch (e) {
      cl('[getStatus].error: $e');
    }
  }

  void filterReportStatus(String status) {
    if (status == 'All' || status == '') {
      _filteredReportStatus = _reportStatus;
    } else {
      _filteredReportStatus =
          _reportStatus.where((report) => report.status == status).toList();
    }
    notifyListeners();
  }
}

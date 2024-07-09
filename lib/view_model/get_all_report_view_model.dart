import 'package:complainz/model/get_all_report_model.dart';
import 'package:complainz/repository/get_all_report_repository.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class GetAllReportViewModel extends ChangeNotifier {
  List<GetAllReportModel> getAllReportt = [];
  List<GetAllReportModel> get getAllReport => getAllReportt;

  void initView(NavigatorState navigator) {
    //getAllReportt(navigator, category: '', sort: null);
  }

  Future<void> getAllReporttt({required String category, required sort}) async {
    try {
      GetAllReportRepository allReport = GetAllReportRepository();
      getAllReportt =
          await allReport.getAllReporttt(category: category, sort: sort);
      cl('[getAllReport].allreport: $allReport');
      notifyListeners();
      //if (allReport != null) {}
    } catch (e) {
      cl('[getAllReport].error $e');
    }
  }
}

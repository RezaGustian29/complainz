import 'package:complainz/repository/create_report_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReportViewModel extends ChangeNotifier {
  final reportController = TextEditingController();

  int reportCount = 0;
  DateTime? _lastReportDate;

  String type = "Complaint";
  int? selectedTag;
  bool? isPublic;

  CreateReportViewModel() {
    loadReportData();
  }

  Future<void> loadReportData() async {
    final prefs = await SharedPreferences.getInstance();
    reportCount = prefs.getInt('reportCount') ?? 0;
    final lastReportDateString = prefs.getString('lastReportDate');
    if (lastReportDateString != null) {
      _lastReportDate = DateTime.parse(lastReportDateString);
    }
    notifyListeners();
  }

  Future<void> saveReportData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('reportCount', reportCount);
    if (_lastReportDate != null) {
      await prefs.setString(
          'lastReportDate', _lastReportDate!.toIso8601String());
    } else {
      await prefs.remove('lastReportDate');
    }
  }

  Future<bool> canCreateReport() async {
    final now = DateTime.now();
    if (_lastReportDate == null || !isSameDay(_lastReportDate!, now)) {
      reportCount = 0;
      _lastReportDate = now;
    }

    return reportCount < 3;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void resetForm() {
    reportController.clear();
    selectedTag = null;
    isPublic = null;
    notifyListeners();
  }

  void resetFormWithoutNotify() {
    reportController.clear();
    selectedTag = null;
    isPublic = null;
  }

  Future<void> resetDailyCount() async {
    reportCount = 0;
    _lastReportDate = null;
    await saveReportData();
    notifyListeners();
  }

  void updateSelectedTag(int? value) {
    selectedTag = value;
    notifyListeners();
  }

  void updateSelecteIsPublic(bool? value) {
    isPublic = value;
    notifyListeners();
  }

  Future<void> createReport(NavigatorState navigator) async {
    if (!await canCreateReport()) {
      AppSnackbar.show(navigator,
          title:
              "Anda telah mencapai batas maksimum laporan (3) untuk hari ini.");
      return;
    }

    if (selectedTag == null || isPublic == null) {
      cl('[createReport].error = "Tag atau opsi belum dipilih"');
      AppSnackbar.show(navigator,
          title: "Kategori atau jenis laporan belum dipilih");
      return;
    }
    AppDialog.showDialogProgress(navigator);

    try {
      CreateReportRepository createReportRepo = CreateReportRepository();
      bool isSuccess = await createReportRepo.createReport(
            type: 'Complaint',
            category_id: selectedTag!,
            photo_url: "",
            video_url: "",
            description: reportController.text,
            is_public: isPublic!,
          ) ??
          false;

      navigator.pop();

      cl('[createReport].res = $isSuccess');

      if (isSuccess) {
        cl('[createReport].success = $isSuccess');
        reportCount++;
        _lastReportDate = DateTime.now();
        await saveReportData();
        resetForm();
        AppSnackbar.show(navigator,
            title: "Laporan berhasil dibuat ($reportCount/3 hari ini)");
      } else {
        cl('[createReport].error = $isSuccess');
        AppDialog.showErrorDialog(navigator, message: isSuccess.toString());
      }
    } catch (e) {
      navigator.pop();
      cl('[createReport].error $e');
      AppDialog.showErrorDialog(navigator, error: e.toString());
    }
  }
}


/* import 'package:complainz/repository/create_report_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReportViewModel extends ChangeNotifier {
  final reportController = TextEditingController();

  int _reportCount = 0;
  DateTime? _lastReportDate;

  /*  @override
  void dispose() {
    reportController.dispose();
    selectedTag = null;
    isPublic = null;
    notifyListeners();
    super.dispose();
  } */

  void resetForm() {
    reportController.clear();
    selectedTag = null;
    isPublic = null;
    notifyListeners();
  }

  String type = "Complaint";
  int? selectedTag;
  bool? isPublic;

  void updateSelectedTag(int? value) {
    selectedTag = value;
    notifyListeners();
  }

  void updateSelecteIsPublic(bool? value) {
    isPublic = value;
    notifyListeners();
  }
  /*  void updateSelectedOption(int? value) {
    selectedOption = value;
    notifyListeners();
  } */

  Future<void> createReport(NavigatorState navigator) async {
    
    if (selectedTag == null || isPublic == null) {
      cl('[createReport].error = "Tag atau opsi belum dipilih"');
      AppSnackbar.show(navigator,
          title: "Kategori atau jenis laporan belum dipilih");
      return;
    }
    AppDialog.showDialogProgress(navigator);

    try {
      CreateReportRepository createReportRepo = CreateReportRepository();
      bool isSuccess = await createReportRepo.createReport(
            type: 'Complaint',
            category_id: selectedTag!,
            photo_url: "",
            video_url: "",
            description: reportController.text,
            is_public: isPublic!,
          ) ??
          false;

      navigator.pop();

      cl('[createReport].res = $isSuccess');

      if (isSuccess) {
        cl('[createReport].success = $isSuccess');
        resetForm();
      } else {
        navigator.pop();
        cl('[createReport].error = $isSuccess');
        AppDialog.showErrorDialog(navigator, message: isSuccess.toString());
      }
    } catch (e) {
      navigator.pop();
      cl('[createReport].error $e');
      AppDialog.showErrorDialog(navigator, error: e.toString());
    }
  }
} */

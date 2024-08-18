import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:complainz/repository/create_report_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:project/widgets/app_dialog.dart';
import 'package:project/widgets/app_snackbar.dart';
import 'package:project/widgets/console_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReportViewModel extends ChangeNotifier {
  final reportController = TextEditingController();

  String? photoBase64;
  File? imageFile;

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

    if (reportController.text.isEmpty) {
      AppSnackbar.show(navigator, title: "Pesan harus diisi");
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
            photo_url: photoBase64 ?? "",
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

  Future<void> convertImageToBase64(File imageFile) async {
    try {
      // Compress the image to JPEG format
      List<int> compressedBytes = await FlutterImageCompress.compressWithFile(
            imageFile.absolute.path,
            format: CompressFormat.jpeg,
            quality: 85,
          ) ??
          [];

      // Convert compressed bytes to base64
      String base64String = base64Encode(compressedBytes);

      // Add MIME type prefix for JPEG
      photoBase64 = 'data:image/jpeg;base64,$base64String';

      // Log the first 100 characters of the base64 string
      // ignore: avoid_print
      print(
          '[convertImageToBase64] = ${photoBase64?.substring(0, min(100, photoBase64!.length))}');

      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print('Error converting image to base64: $e');
      photoBase64 = null;
      notifyListeners();
    }
  }
}

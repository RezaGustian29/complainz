import 'package:complainz/repository/create_aspiration_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAspirationViewModel extends ChangeNotifier {
  final aspirationController = TextEditingController();

  int aspirationCount = 0;
  DateTime? _lastAspirationDate;

  String type = "Aspiration";
  int? selectedTag;
  bool? isPublic;

  CreateAspirationViewModel() {
    loadAspirationData();
  }

  Future<void> loadAspirationData() async {
    final prefs = await SharedPreferences.getInstance();
    aspirationCount = prefs.getInt('aspirationCount') ?? 0;
    final lastAspirationDateString = prefs.getString('lastAspirationDate');
    if (lastAspirationDateString != null) {
      _lastAspirationDate = DateTime.parse(lastAspirationDateString);
    }
    notifyListeners();
  }

  Future<void> saveAspirationData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('aspirationCount', aspirationCount);
    if (_lastAspirationDate != null) {
      await prefs.setString(
          'lastAspirationDate', _lastAspirationDate!.toIso8601String());
    } else {
      await prefs.remove('lastAspirationDate');
    }
  }

  Future<bool> canCreateAspiration() async {
    final now = DateTime.now();
    if (_lastAspirationDate == null || !isSameDay(_lastAspirationDate!, now)) {
      aspirationCount = 0;
      _lastAspirationDate = now;
    }

    return aspirationCount < 3;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void resetForm() {
    aspirationController.clear();
    selectedTag = null;
    isPublic = null;
    notifyListeners();
  }

  void resetFormWithoutNotify() {
    aspirationController.clear();
    selectedTag = null;
    isPublic = null;
  }

  Future<void> resetDailyCount() async {
    aspirationCount = 0;
    _lastAspirationDate = null;
    await saveAspirationData();
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

  Future<void> createAspiration(NavigatorState navigator) async {
    if (!await canCreateAspiration()) {
      AppSnackbar.show(navigator,
          title:
              "Anda telah mencapai batas maksimum laporan (3) untuk hari ini.");
      return;
    }

    if (selectedTag == null || isPublic == null) {
      cl('[createAspiration].error = "Tag atau opsi belum dipilih"');
      AppSnackbar.show(navigator,
          title: "Kategori atau jenis laporan belum dipilih");
      return;
    }
    AppDialog.showDialogProgress(navigator);

    try {
      CreateAspirationRepository createAspirationRepo =
          CreateAspirationRepository();
      bool isSuccess = await createAspirationRepo.createAspiration(
            type: 'Aspiration',
            category_id: selectedTag!,
            photo_url: "",
            video_url: "",
            description: aspirationController.text,
            is_public: isPublic!,
          ) ??
          false;

      navigator.pop();

      cl('[createAspiration].res = $isSuccess');

      if (isSuccess) {
        cl('[createAspiration].success = $isSuccess');
        aspirationCount++;
        _lastAspirationDate = DateTime.now();
        await saveAspirationData();
        resetForm();
        AppSnackbar.show(navigator,
            title: "Laporan berhasil dibuat ($aspirationCount/3 hari ini)");
      } else {
        cl('[createAspiration].error = $isSuccess');
        AppDialog.showErrorDialog(navigator, message: isSuccess.toString());
      }
    } catch (e) {
      navigator.pop();
      cl('[createAspiration].error $e');
      AppDialog.showErrorDialog(navigator, error: e.toString());
    }
  }
}

import 'package:complainz/repository/create_report_repository.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class CreateReportViewModel extends ChangeNotifier {
  final reportController = TextEditingController();

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
}

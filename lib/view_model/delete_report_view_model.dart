import 'package:complainz/repository/delete_report_repository.dart';
import 'package:flutter/foundation.dart';

class DeleteReportViewModel extends ChangeNotifier {
  Enum? _deleteComplaintId;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isDeleted = false;

  Enum? get deleteComplaintId => _deleteComplaintId;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeleted => _isDeleted;

  Future<void> deleteResultCompaintId({required int id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      DeleteReportRepository api = DeleteReportRepository();
      _deleteComplaintId = await api.deleteComplaintId(id: id);

      if (_deleteComplaintId == Type.deleted) {
        _isDeleted = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isDeleted = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isDeleted = false;
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}

/* import 'package:complainz/repository/delete_report_repository.dart';
import 'package:complainz/widgets/app_snackbar.dart';
import 'package:complainz/widgets/console_log.dart';
import 'package:flutter/material.dart';

class DeleteReportViewModel extends ChangeNotifier {
  final DeleteReportRepository _deleteReportRepository =
      DeleteReportRepository();

  Future<void> deleteReport(BuildContext context, {required int id}) async {
    try {
      final result = await _deleteReportRepository.deleteReport(id: id);
      if (result == null) {
        cl('[deleteReport].success = Report deleted successfully');
        AppSnackbar.show(Navigator.of(context), title: 'Data berhasil dihapus');
        notifyListeners();
      } else {
        cl('[deleteReport].error = $result');
        AppSnackbar.show(Navigator.of(context),
            title: 'Gagal menghapus data: $result');
      }
    } catch (e) {
      cl('[deleteReport].error: $e');
      AppSnackbar.show(Navigator.of(context), title: 'Terjadi kesalahan: $e');
    }
  }
} */

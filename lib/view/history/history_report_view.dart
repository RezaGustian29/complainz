import 'package:complainz/view/history/components/history_report_tile.dart';
import 'package:complainz/view_model/delete_report_view_model.dart';
import 'package:complainz/view_model/get_report_status_view_model.dart';
import 'package:project/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:provider/provider.dart';

class HistoryReportView extends StatefulWidget {
  const HistoryReportView({super.key});

  @override
  State<HistoryReportView> createState() => _HistoryReportViewState();
}

class _HistoryReportViewState extends State<HistoryReportView> {
  Map<String, bool> buttonState = {
    'Semua': true,
    'Pending': false,
    'DiProses': false,
    'DiJawab': false,
    //'DiJawab': false,
    //'Aspirasi': false,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetReportStatusViewModel>(context, listen: false)
          .getResultReportStatus(status: "All");
    });
  }

  final List<Map<String, String>> reports = [
    {'title': 'Mata Kuliah Banyak Tugas', 'description': 'Deskripsi laporan 1'},
    {'title': 'Dosen Jarang Mengajar', 'description': 'Deskripsi laporan 2'},
    {'title': 'Toilet Rusak di Gedung A', 'description': 'Deskripsi laporan 3'},
    {'title': 'Toilet Rusak di Gedung A', 'description': 'Deskripsi laporan 3'},
    {'title': 'Toilet Rusak di Gedung A', 'description': 'Deskripsi laporan 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: AppSizes.padding),
              child: Text(
                'Riwayat Laporan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
        body: NestedScrollView(
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: AppSizes.padding,
              toolbarHeight: AppSizes.padding * 3,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(right: AppSizes.padding),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: AppSizes.padding),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: buttonState.keys.map((text) {
                    return Row(
                      children: [
                        _buildButton(context, text),
                        const SizedBox(width: 8),
                      ],
                    );
                  }).toList()),
                ),
              ),
            ),
          ],
          body: body(),
        ));
  }

  Widget _buildButton(BuildContext context, String text) {
    bool isSelected = buttonState[text]!;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          buttonState.updateAll((key, value) => false);
          buttonState[text] = !isSelected;
        });

        String sortOrder = 'asc';
        if (text == 'Semua') {
          sortOrder = 'All';
        } else if (text == 'Pending') {
          sortOrder = 'Pending';
        } else if (text == 'DiProses') {
          sortOrder = 'Diterima';
        } else if (text == 'DiJawab') {
          sortOrder = 'Resolved';
        }

        if (buttonState[text]!) {
          Provider.of<GetReportStatusViewModel>(context, listen: false)
              .getResultReportStatus(status: sortOrder);
        } else {
          // Fetch all reports without any specific order if 'Semua' is selected or button is deselected
          Provider.of<GetReportStatusViewModel>(context, listen: false)
              .getResultReportStatus(status: "");
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
        side: const BorderSide(color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
    );
  }

  Widget body() {
    return Consumer2<GetReportStatusViewModel, DeleteReportViewModel>(
        builder: (context, model, deleteModel, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Laporan Saya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Cabut',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.primaryColor),
          Expanded(
            child: ListView.builder(
              itemCount: model.filteredReportStatus.length,
              itemBuilder: (context, i) {
                final result = model.filteredReportStatus[i];
                return HistoryReportTile(
                  description: result.description,
                  onPressed: () {
                    _showDeleteConfirmationDialog(
                        context, deleteModel, result.id);
                  },
                  //description: "${i + 1}. ${result.description}",
                );
              },
            ),
          ),
        ]),
      );
    });
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, DeleteReportViewModel deleteModel, int reportId) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.primaryColor,
          content: const SizedBox(
            height: 100,
            child: Column(
              children: [
                Icon(Icons.delete, size: 50, color: AppColors.timelineColor),
                SizedBox(height: AppSizes.padding / 2),
                Text(
                  'Kamu Yakin Untuk Mencabut Laporan?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ya, Hapus',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _deleteReport(
                  context,
                  Navigator.of(context),
                  deleteModel,
                  reportId,
                );
              },
            ),
            TextButton(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                    color: AppColors.timelineColor),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding,
                      vertical: AppSizes.padding / 2),
                  child: Text(
                    'Tidak',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  void _deleteReport(BuildContext context, NavigatorState Navigator,
      DeleteReportViewModel deleteModel, int reportId) async {
    await deleteModel.deleteResultCompaintId(id: reportId);

    // Periksa apakah context masih valid
    if (!context.mounted) return;

    if (deleteModel.isDeleted) {
      if (context.mounted) {
        AppSnackbar.show(Navigator, title: 'Laporan berhasil dihapus');
      }
      // Refresh the report list
      if (context.mounted) {
        Provider.of<GetReportStatusViewModel>(context, listen: false)
            .getResultReportStatus(status: "All");
      }
    } else {
      if (context.mounted) {
        AppSnackbar.show(Navigator,
            title: 'Gagal menghapus laporan: ${deleteModel.errorMessage}');
      }
    }
  }
}

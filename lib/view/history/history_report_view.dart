import 'package:complainz/view/history/components/history_report_tile.dart';
import 'package:complainz/view_model/get_report_status_view_model.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            children: [
              Expanded(child: body()),
              const SizedBox(height: AppSizes.padding),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Consumer<GetReportStatusViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.padding),
          color: AppColors.timelineColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
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
                itemCount: model.reportStatus.length,
                itemBuilder: (context, i) {
                  final result = model.reportStatus[i];
                  return HistoryReportTile(
                    description: "${i + 1}. ${result.description}",
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}



/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:flutter/material.dart';

class HistoryReportView extends StatefulWidget {
  const HistoryReportView({super.key});

  @override
  State<HistoryReportView> createState() => _HistoryReportViewState();
}

class _HistoryReportViewState extends State<HistoryReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            children: [
              const AppBackButton(text: 'Riwayat Laporan'),
              const SizedBox(height: AppSizes.padding),
              body(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.padding),
        color: AppColors.timelineColor,
      ),
      child: Column(
        children: [
          Table(
            border: TableBorder.all(color: AppColors.timelineColor),

            //columnWidths: const <int, TableColumnWidth>{},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              const TableRow(
                children: <Widget>[
                  TableCell(
                    child: Text(
                      'Laporan Saya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Cabut',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  const Text(
                    'Lantai 3 Ac Rusak',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Lantai 3 Ac Rusak',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextButton(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.radius * 1.5),
                          color: AppColors.primaryColor),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.padding,
                            vertical: AppSizes.padding / 2),
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/status');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */
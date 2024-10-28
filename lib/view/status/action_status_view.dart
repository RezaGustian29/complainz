import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:project/widgets/app_back_button.dart';
import 'package:flutter/material.dart';

class ActionStatusView extends StatefulWidget {
  const ActionStatusView({super.key});

  @override
  State<ActionStatusView> createState() => _ActionStatusViewState();
}

class _ActionStatusViewState extends State<ActionStatusView> {
  bool? isChecked = false;
  final List<Map<String, String>> reports = [
    {'title': 'Mata Kuliah Banyak Tugas'},
    {'title': 'Dosen Jarang Mengajar'},
    {'title': 'Toilet Rusak di Gedung A'},
  ];

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
              Expanded(child: body()),
              const SizedBox(height: AppSizes.padding),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
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
                  'Saya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.timelineColor,
                  ),
                ),
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
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.padding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          '${reports[index]['title']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _dialogBuilder(context);
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 25,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
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
                //Navigator.of(context).pop();
                success(context);
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

  Future<void> success(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: AppColors.primaryColor,
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                Icon(Icons.check, size: 50, color: AppColors.timelineColor),
                SizedBox(height: AppSizes.padding / 2),
                Text(
                  'Laporan Terhapus',
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
        );
      },
    );
  }
}





/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ActionStatusView extends StatefulWidget {
  const ActionStatusView({super.key});

  @override
  State<ActionStatusView> createState() => _ActionStatusViewState();
}

class _ActionStatusViewState extends State<ActionStatusView> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            children: [
              const AppBackButton(text: 'Detail Status'),
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
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.padding),
        color: AppColors.timelineColor,
      ),
      child: Column(
        children: [
          Table(
            //border: TableBorder.all(),
            //columnWidths: const <int, TableColumnWidth>{},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              const TableRow(
                children: <Widget>[
                  Text(
                    'Laporan Saya',
                    style: TextStyle(color: AppColors.timelineColor),
                  ),
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
                /* decoration: const BoxDecoration(
                  color: Colors.grey,
                ), */
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Lantai 3 Ac Rusak',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _dialogBuilder(context);
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 25,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: AppButton(
              onTap: () {},
              text: 'Cabut Laporan',
              buttonColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
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
                //Navigator.of(context).pop();
                success(context);
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

  Future<void> success(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: AppColors.primaryColor,
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                Icon(Icons.check, size: 50, color: AppColors.timelineColor),
                SizedBox(height: AppSizes.padding / 2),
                Text(
                  'Laporan Terhapus',
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
        );
      },
    );
  }
}
 */
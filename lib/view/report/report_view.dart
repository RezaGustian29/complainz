import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/report/components/report_card_tile.dart';
import 'package:complainz/view_model/get_all_report_view_model.dart';
import 'package:project/widgets/app_appbar.dart';
import 'package:project/widgets/app_empty_state.dart';
import 'package:project/widgets/app_progres_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> list = <String>[
  'Terbaru',
  'Terlama',
];

class ReportView extends StatefulWidget {
  final String category;

  const ReportView({
    super.key,
    required this.category,
  });

  @override
  State<ReportView> createState() => _ReportViewState();
}

//late String dropdownValue;
String dropdownValue = list.first;

class _ReportViewState extends State<ReportView> {
  Map<String, bool> buttonState = {
    'Semua': true,
    'Terbaru': false,
    'Terlama': false,
    // 'Complaint': false,
    // 'Aspirasi': false,
  };

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<GetAllReportViewModel>(context, listen: false)
            .getAllReporttt(category: widget.category, sort: "desc");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: AppSizes.padding,
              toolbarHeight: AppSizes.padding * 3,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(right: AppSizes.padding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSizes.padding),
                    child: Row(
                      children: buttonState.keys.map((text) {
                        return Row(
                          children: [
                            _buildButton(context, text),
                            const SizedBox(width: 8),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: content(),
      ),
    );
  }

  AppAppbar appBar() {
    return const AppAppbar(
      title: 'Laporan',
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    bool isSelected = buttonState[text]!;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          buttonState.updateAll((key, value) => false);
          buttonState[text] = !isSelected;
        });

        String sortOrder = 'desc'; // Default sort order
        if (text == 'Terbaru') {
          sortOrder = 'desc';
        } else if (text == 'Terlama') {
          sortOrder = 'asc';
        }

        if (buttonState[text]!) {
          Provider.of<GetAllReportViewModel>(context, listen: false)
              .getAllReporttt(category: widget.category, sort: sortOrder);
        } else {
          // Fetch all reports without any specific order if 'Semua' is selected or button is deselected
          Provider.of<GetAllReportViewModel>(context, listen: false)
              .getAllReporttt(category: widget.category, sort: '');
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

  Widget dropdown() {
    return DropdownMenu<String>(
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;

          if (dropdownValue == 'Terbaru') {
            setState(() {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<GetAllReportViewModel>(context, listen: false)
                    .getAllReporttt(category: widget.category, sort: "desc");
              });
            });
          }
          if (dropdownValue == 'Terlama') {
            setState(() {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<GetAllReportViewModel>(context, listen: false)
                    .getAllReporttt(category: widget.category, sort: "asc");
              });
            });
          }
        });
      },
      textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor), // Adjust text size if needed
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        constraints: const BoxConstraints.tightFor(
            height: 40), // Set your desired height here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
      ),
      menuStyle: MenuStyle(
        maximumSize: WidgetStateProperty.all(
            const Size.fromHeight(200)), // Limit menu height if needed
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry(
            value: value,
            label: value,
            style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget content() {
    return Consumer<GetAllReportViewModel>(
      builder: (context, model, _) {
        // ignore: unnecessary_null_comparison
        if (model.getAllReport == null || model.isLoading) {
          return const Center(
            child: AppProgresIndicator(),
          );
        }

        if (model.getAllReport.isEmpty) {
          return const Center(
            child: AppEmptyState(),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: model.getAllReport.length,
          itemBuilder: (context, i) {
            final result = model.getAllReport[i];
            return AppReportCardTile(
              photoUrl: result.photoProfile,
              fullname: result.fullName,
              username: "@${result.username}",
              createdAt: result.createdAt,
              description: result.description,
              fedback: result.feedback ?? '',
              reportImage: result.photoUrl ?? '',
            );
          },
        );
      },
    );
  }

  /* Widget content() {
    return Consumer<GetAllReportViewModel>(
      builder: (context, model, _) {
        // ignore: unnecessary_null_comparison
        if (model.getAllReport == null) {
          return const Center(
            child: AppProgresIndicator(),
          );
        }

        if (model.getAllReport.isEmpty) {
          return const Center(
            child: AppEmptyState(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: model.getAllReport.length,
          itemBuilder: (context, i) {
            final result = model.getAllReport[i];
            return AppReportCardTile(
              photoUrl: result.photoProfile,
              fullname: result.fullName,
              username: "@${result.username}",
              createdAt: result.createdAt,
              description: result.description,
              fedback: result.feedback ?? '',
              reportImage: result.photoUrl ?? '',
            );
          },
        );
      },
    );
  } */
/* 
  Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: AppSizes.padding / 2),
            child: Container(
              width: double.infinity,
              //height: 337,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.contentColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppSizes.radius * 2.5,
                    horizontal: AppSizes.radius * 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/images_profile.png',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //final result = model.getAllReport[i];
                              Text(
                                result.username,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                result.fullName,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          result.createdAt,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      width: double.infinity,
                      height: 63,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: AppColors.secondaryTextColor,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Laporan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              result.description,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            /*  Image.asset(
                                    'assets/images/images_logo.png',
                                    width: 50,
                                  ), */
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding,
                          vertical: AppSizes.padding / 2),
                      width: double.infinity,
                      height: 82,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: AppColors.primaryColor,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tindak Lanjut',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          SizedBox(height: AppSizes.padding / 3),
                          Text(
                            'Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ); */

  /* Widget content() {
    return Column(
      children: [
        ...List.generate(
          7,
          (index) => Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: AppSizes.padding / 2),
            child: Container(
              width: double.infinity,
              //height: 337,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.contentColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppSizes.radius * 2.5,
                    horizontal: AppSizes.radius * 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/images_profile.png',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alexander Grahambel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'alexander@gmail.com',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '12/05/2024',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      width: double.infinity,
                      height: 63,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: AppColors.secondaryTextColor,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Laporan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Dosen Matakuliah salah memasukan nilai',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            /*  Image.asset(
                              'assets/images/images_logo.png',
                              width: 50,
                            ), */
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding,
                          vertical: AppSizes.padding / 2),
                      width: double.infinity,
                      height: 82,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: AppColors.primaryColor,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tindak Lanjut',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          SizedBox(height: AppSizes.padding / 3),
                          Text(
                            'Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  } */
}

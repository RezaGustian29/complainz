import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/report/components/report_card_tile.dart';
import 'package:complainz/view_model/get_all_report_view_model.dart';
import 'package:complainz/widgets/app_progres_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportView extends StatefulWidget {
  final String category;

  const ReportView({
    super.key,
    required this.category,
  });

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllReportViewModel>(context, listen: false)
          .getAllReporttt(category: widget.category, sort: "desc");
    });
  }

  @override
  Widget build(BuildContext context) {
    //final getAllReportViewModel = Provider.of<GetAllReportViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              const SizedBox(height: AppSizes.padding),
              content(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/icons_arrow_back.png',
              width: 40,
            ),
          ),
          const Text(
            'Laporan',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Consumer<GetAllReportViewModel>(builder: (context, model, _) {
      // ignore: unnecessary_null_comparison
      if (model.getAllReportt.isEmpty) {
        return const Center(
          child: AppProgresIndicator(),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: model.getAllReport.length,
        itemBuilder: (context, i) {
          final result = model.getAllReport[i];
          return AppReportCardTile(
            photoUrl: result.photoProfile ?? 'assets/images/images_profile.png',
            fullname: result.fullName,
            username: "@${result.username}",
            createdAt: result.createdAt,
            description: result.description,
            fedback: result.feedback ?? '',
          );
        },
      );
    });
  }
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

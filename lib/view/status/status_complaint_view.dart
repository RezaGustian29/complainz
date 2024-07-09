import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_card_status.dart';
import 'package:complainz/widgets/app_timeline.dart';
import 'package:flutter/material.dart';

class StatusComplaintView extends StatefulWidget {
  const StatusComplaintView({super.key});

  @override
  State<StatusComplaintView> createState() => _StatusComplaintViewState();
}

class _StatusComplaintViewState extends State<StatusComplaintView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.padding / 1.5),
              const AppBackButton(text: 'Detail Status'),
              Expanded(
                child: Center(
                  child: timeline(),
                ),
              ),
              const SizedBox(height: AppSizes.padding),
              updateButton(),
              const SizedBox(height: AppSizes.padding),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeline() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTimeline(
          isFirst: true,
          isLast: false,
          endChild: AppCardStatus(
            title: 'Complaint Diterima',
            subTitle: 'Laporan anda sudah kami terima',
            images: 'assets/images/images_status1.png',
            onTap: () {
              Navigator.pushNamed(context, '/action-status');
            },
          ),
        ),
        AppTimeline(
          isFirst: false,
          isLast: false,
          endChild: AppCardStatus(
            title: 'Complaint Diterima',
            subTitle: 'Laporan anda sudah kami terima',
            images: 'assets/images/images_status2.png',
            onTap: () {},
          ),
        ),
        AppTimeline(
          isFirst: false,
          isLast: true,
          endChild: AppCardStatus(
            title: 'Complaint Terjawab',
            subTitle: 'Laporan anda sedang kami proses',
            images: 'assets/images/images_status3.png',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget updateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppButton(
        onTap: () {
          Navigator.pushNamed(context, '/action-status');
        },
        text: 'Edit Laporan',
      ),
    );
  }
}


/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_card_status.dart';
import 'package:complainz/widgets/app_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusComplaintView extends StatefulWidget {
  const StatusComplaintView({super.key});

  @override
  State<StatusComplaintView> createState() => _StatusComplaintViewState();
}

class _StatusComplaintViewState extends State<StatusComplaintView> {
  bool isFirst = true;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppSizes.padding / 1.5),
              const AppBackButton(text: 'Status Complaint'),
              Expanded(
                child: Center(
                  child: timeline(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeline() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTimeline(
          isFirst: true,
          isLast: false,
          endChild: AppCardStatus(
            title: 'Complaint Diterima',
            subTitle: 'Laporan anda sudah kami terima',
            images: 'assets/images/images_status1.png',
            onTap: () {},
          ),
        ),
        AppTimeline(
          isFirst: false,
          isLast: false,
          endChild: AppCardStatus(
            title: 'Complaint Diterima',
            subTitle: 'Laporan anda sudah kami terima',
            images: 'assets/images/images_status2.png',
            onTap: () {},
          ),
        ),
        AppTimeline(
          isFirst: false,
          isLast: true,
          endChild: AppCardStatus(
            title: 'Complaint Diterima',
            subTitle: 'Laporan anda sedang kami proses',
            images: 'assets/images/images_status3.png',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget updateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppButton(
        onTap: () {
          Navigator.pushNamed(context, '/action-status');
        },
        text: 'Edit Laporan',
      ),
    );
  }

  Widget statusContent(
    String text1,
    String text2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.padding / 1.5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/action-status');
        },
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  color: Colors.amber,
                  child: Text(
                    text1,
                    //'Complaint Diterima',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                text2,
                //'Laporan anda sudah kami terima',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} */

  

  /* Widget timeline() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          AppTimeline(
            isFirst: true,
            isLast: false,
            endChild: statusContent(
              'Complaint Diterima',
              'Laporan anda sudah kami terima',
            ),
          ),
          AppTimeline(
            isFirst: false,
            isLast: false,
            endChild: statusContent(
              'Complaint Diterima',
              'Laporan anda sudah kami terima',
            ),
          ),
          AppTimeline(
            isFirst: false,
            isLast: true,
            endChild: statusContent(
              'Complaint Terjawab',
              'Laporan anda sedang kami proses',
            ),
          ),
        ],
      ),
    );
  } */


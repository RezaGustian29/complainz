import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/get_user_profile_view_model.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_progres_indicator.dart';
import 'package:complainz/widgets/app_text_link.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetUserProfileViewModel>(context, listen: false)
          .getResultUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.padding),
              pictureProfile(),
              const SizedBox(height: AppSizes.padding),
              cardInfo(),
              const SizedBox(height: AppSizes.padding * 2),
              settingCard(),
              const SizedBox(height: AppSizes.padding),
              bottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pictureProfile() {
    return Consumer<GetUserProfileViewModel>(builder: (context, model, _) {
      if (model.userProfile == null) {
        return const Center(
          child: AppProgresIndicator(),
        );
      }
      final result = model.userProfile;
      return Center(
        child: Column(
          children: [
            Container(
              width: 145,
              height: 145,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: result!.photo_profile != null &&
                          result.photo_profile!.isNotEmpty
                      ? NetworkImage(result.photo_profile!) as ImageProvider
                      : const AssetImage('assets/images/images_ormawa.png')
                          as ImageProvider,
                  fit: BoxFit.fill,
                ),
                shape: const OvalBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF636D89),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              result.full_name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      );
    });
  }

  /* Widget pictureProfile() {
    return Consumer<GetUserProfileViewModel>(builder: (context, model, _) {
      if (model.userProfile.isEmpty) {
        return const Center(
          child: AppProgresIndicator(),
        );
      }
      final result = model.userProfile;
      return Center(
        child: Column(
          children: [
            Container(
              width: 145,
              height: 145,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/images_ormawa.png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF636D89),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      );
    });
  } */

  Widget cardInfo() {
    return Consumer<GetUserProfileViewModel>(builder: (context, model, _) {
      final result = model.userProfile;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.padding / 2),
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radius * 2),
            color: AppColors.contentColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 8,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result?.laporan.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    'Laporan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                color: AppColors.primaryColor,
                thickness: 1.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result?.pending.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    'Diterima',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                color: AppColors.primaryColor,
                thickness: 1.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result?.proccess.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    'Diproses',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                color: AppColors.primaryColor,
                thickness: 1.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result?.resolved.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    'Dijawab',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget settingCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.padding),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radius * 2),
              color: AppColors.contentColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                AppTextLink(
                  icon: Icons.pin_drop,
                  text: 'Complain Tersimpan',
                  divider: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/action-status');
                  },
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                AppTextLink(
                  icon: Icons.date_range,
                  text: 'Riwayat Laporan Saya',
                  divider: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/history');
                  },
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                AppTextLink(
                  icon: Icons.person,
                  text: 'Ubah Profile',
                  divider: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/update-profile');
                  },
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                AppTextLink(
                  icon: Icons.lock,
                  text: 'Ganti Password',
                  onTap: () {
                    Navigator.pushNamed(context, '/update-pass');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(AppSizes.padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: const Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.priority_high),
                      SizedBox(width: AppSizes.padding),
                      Text(
                        'Tentang Kami',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomButton() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          AppButton(
            height: 40,
            onTap: () {},
            text: 'Logout',
            titleStyle: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            buttonColor: Colors.transparent,
            border: const BorderSide(width: 1, color: AppColors.primaryColor),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          AppButton(
            height: 40,
            buttonColor: Colors.red,
            onTap: () {
              _dialogBuilder(context);
            },
            text: 'Hapus Akun',
            titleStyle: const TextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
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
                  'Kamu Yakin Untuk Menghapus Akun?',
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
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Berhasil Dihapus',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    backgroundColor: Colors.green,
                    showCloseIcon: true,
                  ),
                );
                //Navigator.of(context).pop();
                //success(context);
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
}

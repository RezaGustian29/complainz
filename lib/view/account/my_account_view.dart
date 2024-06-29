import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_text_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
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
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget cardInfo() {
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '20',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Laporan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            VerticalDivider(
              color: AppColors.primaryColor,
              thickness: 1.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Diterima',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            VerticalDivider(
              color: AppColors.primaryColor,
              thickness: 1.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Diproses',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            VerticalDivider(
              color: AppColors.primaryColor,
              thickness: 1.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
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
                  onTap: () {},
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                AppTextLink(
                  icon: Icons.date_range,
                  text: 'Riwayat Laporan Saya',
                  divider: true,
                  onTap: () {},
                ),
                const SizedBox(height: AppSizes.padding / 1.5),
                AppTextLink(
                  icon: Icons.person,
                  text: 'Ubah Profile',
                  divider: true,
                  onTap: () {},
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
            onTap: () {},
            text: 'Hapus Akun',
          ),
        ],
      ),
    );
  }
}

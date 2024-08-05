import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_appbar.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: 'Tentang Kami',
      ),
      body: SafeArea(
        child: Center(child: body()),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/images_logo.png', // Make sure to add your image in the assets folder
            width: 250,
          ),
          const SizedBox(height: AppSizes.padding),
          const Text(
            "Complainz adalah sebuah aplikasi yang dirancang untuk memudahkan mahasiswa dalam memberikan laporan dan aspirasi terkait dengan keadaan di kampus. Dengan menggunakan aplikasi ini, pengguna dapat dengan mudah membuat laporan terkait masalah kampus seperti fasilitas yang rusak, kurangnya fasilitas, perilaku tidak etis dari staf atau dosen, atau hal-hal lainnya yang mempengaruhi kualitas hidup mahasiswa di kampus. ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: AppSizes.padding),
          const Text(
              "Aplikasi Complainz juga menyediakan fitur untuk memberikan aspirasi atau saran terkait dengan pembangunan kampus dan program-program yang diadakan di kampus. Mahasiswa dapat memberikan masukan terkait dengan hal-hal yang dianggap perlu diperbaiki atau diadakan di kampus. Dalam aplikasi ini, setiap laporan atau aspirasi akan disimpan secara rapih dan dilengkapi dengan data waktu dan lokasi yang terdeteksi oleh perangkat pengguna. Hal ini akan memudahkan pihak kampus dalam mengidentifikasi dan menyelesaikan masalah yang dilaporkan oleh mahasiswa.",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
              textAlign: TextAlign.left),
          const SizedBox(height: AppSizes.padding),
          const Text(
              "Complainz juga memiliki fitur untuk melacak status laporan atau aspirasi yang telah diajukan oleh pengguna. Dengan demikian, pengguna dapat mengetahui apakah laporan atau aspirasinya telah diproses oleh pihak kampus atau belum.",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
              textAlign: TextAlign.left),
          const SizedBox(height: AppSizes.padding),
          const Text(
              "Secara keseluruhan, Complainz adalah aplikasi yang sangat berguna bagi mahasiswa untuk memberikan masukan dan melaporkan masalah di kampus secara efektif dan efisien.",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }
}

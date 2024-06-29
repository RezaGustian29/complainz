import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateReportComplaintView extends StatefulWidget {
  final String? title;
  final Widget? child;
  const CreateReportComplaintView({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<CreateReportComplaintView> createState() =>
      _CreateReportComplaintViewState();
}

class _CreateReportComplaintViewState extends State<CreateReportComplaintView> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  int? tag;
  int selectedOption = 1;
  /*  List<String> tags = [];
  List<String> options = [
    'Dosen dan Staff Akademik',
    'Sarana dan Prasarana',
    'Organisasi Mahasiswa',
    'Sistem Perkuliahan',
    'Mahasiswa',
    'Lainnya',
  ]; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: AppSizes.padding),
            child: Column(
              children: [
                const AppBackButton(
                    text: 'Pengaduan',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: AppSizes.padding),
                form(),
                complaintButton(),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: SafeArea(child: complaintButton()),
    );
  }

  Widget form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Masukkan Pesan Anda',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        TextFormField(
          minLines: 6,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Ketik disini...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        const Text(
          'Pilih Kategori',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        tags(),
        const SizedBox(height: AppSizes.padding),
        const Text(
          'Jenis Laporan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        options(),
      ],
    );
  }

  Widget tags() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
      child: Center(
        child: Wrap(
          spacing: 8.0, // jarak horizontal antara chips
          runSpacing: 4.0,
          children: [
            ChoiceChip(
              label: const Text('Dosen'),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected1 ? Colors.white : AppColors.primaryColor,
              ),
              showCheckmark: false,
              selected: isSelected1,
              selectedColor: AppColors.primaryColor,
              onSelected: (value) {
                setState(() {
                  isSelected1 = value;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Akademik'),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected2 ? Colors.white : AppColors.primaryColor,
              ),
              showCheckmark: false,
              selected: isSelected2,
              selectedColor: AppColors.primaryColor,
              onSelected: (value) {
                setState(() {
                  isSelected2 = value;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Sarana dan Prasarana'),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected3 ? Colors.white : AppColors.primaryColor,
              ),
              showCheckmark: false,
              selected: isSelected3,
              selectedColor: AppColors.primaryColor,
              onSelected: (value) {
                setState(() {
                  isSelected3 = value;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Organisasi Mahasiswa'),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected4 ? Colors.white : AppColors.primaryColor,
              ),
              showCheckmark: false,
              selected: isSelected4,
              selectedColor: AppColors.primaryColor,
              onSelected: (value) {
                setState(() {
                  isSelected4 = value;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Mahasiswa'),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected5 ? Colors.white : AppColors.primaryColor,
              ),
              showCheckmark: false,
              selected: isSelected5,
              selectedColor: AppColors.primaryColor,
              onSelected: (value) {
                setState(() {
                  isSelected5 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget options() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          title: const Text('Umum'),
          value: 1,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(
              () {},
            );
          },
        ),
        RadioListTile(
          title: const Text('Rahasia'),
          value: 2,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(
              () {},
            );
          },
        ),
      ],
    );
  }

  Widget complaintButton() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: AppButton(
        onTap: () {
          // Navigator.pushNamed(context, '/create-aspiration');
        },
        text: 'Kirim',
        height: 45,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

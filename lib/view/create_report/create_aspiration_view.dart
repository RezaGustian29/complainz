import 'dart:io';

import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/create_aspiration_view_model.dart';
import 'package:project/widgets/app_appbar.dart';
import 'package:project/widgets/app_button.dart';
import 'package:project/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateAspirationView extends StatefulWidget {
  const CreateAspirationView({super.key});

  @override
  State<CreateAspirationView> createState() => _CreateAspirationViewState();
}

class _CreateAspirationViewState extends State<CreateAspirationView>
    with WidgetsBindingObserver {
  int? selectedTag; // Variabel untuk menyimpan tag yang dipilih
  int? selectedOption;

  final List<Map<String, dynamic>> tags = [
    {'label': 'Dosen dan Staff Akademik', 'value': 1},
    {'label': 'Sarana dan Prasarana', 'value': 2},
    {'label': 'Organisasi Mahasiswa', 'value': 3},
    {'label': 'Sistem Perkuliahan', 'value': 4},
    {'label': 'Mahasiswa', 'value': 5},
  ];

  //untuk reset form ketika switch ke halaman lain dan kembali lagi form kosong
  CreateAspirationViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //_viewModel = Provider.of<CreateAspirationViewModel>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel ??=
        Provider.of<CreateAspirationViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _viewModel?.resetFormWithoutNotify();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _viewModel?.resetFormWithoutNotify();
    }
  }

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: 'Aspirasi',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: AppSizes.padding),
            child: Column(
              children: [
                const SizedBox(height: AppSizes.padding),
                form(),
                complaintButton(),
                //resetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Consumer<CreateAspirationViewModel>(builder: (context, model, _) {
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
          Stack(
            children: [
              TextFormField(
                controller: model.aspirationController,
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
              Positioned(
                bottom: 1,
                right: 240,
                child: Container(
                  width: 83,
                  height: 36.40,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 21,
                            color: Colors.yellow,
                          ),
                          onPressed: () async {
                            ImagePicker()
                                .pickImage(
                                    source: ImageSource.camera,
                                    preferredCameraDevice: CameraDevice.rear)
                                .then((value) {
                              if (value != null) {
                                final imageFile = File(value.path);
                                model.convertImageToBase64(imageFile);
                                setState(() {
                                  image = value;
                                });
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.image,
                            size: 21,
                            color: Colors.yellow,
                          ),
                          onPressed: () async {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              if (value != null) {
                                final imageFile = File(value.path);
                                model.convertImageToBase64(imageFile);
                                setState(() {
                                  image = value;
                                });
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (image != null) ...[
            const SizedBox(height: AppSizes.padding),
            GestureDetector(
              onTap: () => _showImagePreview(context, image!),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(image!.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSizes.padding),
          const Text(
            'Pilih Kategori',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          tagsWidget(),
          const SizedBox(height: AppSizes.padding),
          const Text(
            'Jenis Aspirasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          options(),
        ],
      );
    });
  }

  Widget tagsWidget() {
    return Consumer<CreateAspirationViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.all(AppSizes.padding),
        width: double.infinity,
        height: 225,
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
            runSpacing: 0.0,
            children: tags.map((tag) {
              return ChoiceChip(
                label: Text(tag['label']),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: model.selectedTag == tag['value']
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                showCheckmark: false,
                selected: model.selectedTag == tag['value'],
                selectedColor: AppColors.primaryColor,
                onSelected: (bool selected) {
                  setState(() {
                    model.updateSelectedTag(selected ? tag['value'] : null);
                  });
                },
              );
            }).toList(),
          ),
        ),
      );
    });
  }

  Widget options() {
    return Consumer<CreateAspirationViewModel>(builder: (context, model, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<bool?>(
            title: const Text('Umum'),
            value: true,
            groupValue: model.isPublic,
            onChanged: (bool? value) {
              setState(() {
                model.updateSelectedIsPublic(
                    model.isPublic == true ? null : value);
              });
            },
          ),
          RadioListTile<bool?>(
            title: const Text('Rahasia'),
            value: false,
            groupValue: model.isPublic,
            onChanged: (bool? value) {
              setState(() {
                model.updateSelectedIsPublic(
                    model.isPublic == false ? null : value);
              });
            },
          ),
        ],
      );
    });
  }

  Widget complaintButton() {
    return Consumer<CreateAspirationViewModel>(builder: (context, model, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
        child: AppButton(
          onTap: () async {
            FocusScope.of(context).unfocus();

            final navigator = Navigator.of(context);
            model.createAspiration(navigator);
          },
          text: 'Kirim',
          height: 45,
          fontWeight: FontWeight.w700,
        ),
      );
    });
  }
}

Widget resetButton() {
  return Consumer<CreateAspirationViewModel>(builder: (context, model, _) {
    //// Jika bukan mode debug, tidak menampilkan apa-apa
    //if (!kDebugMode)return SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Column(
        children: [
          AppButton(
            onTap: () async {
              await model.resetDailyCount();
              // ignore: use_build_context_synchronously
              AppSnackbar.show(Navigator.of(context),
                  title: 'berhasil reset harian');
            },
            text: 'Reset',
            height: 45,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  });
}

void _showImagePreview(BuildContext context, XFile image) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: 'imagePreview',
              child: Image.file(
                File(image.path),
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

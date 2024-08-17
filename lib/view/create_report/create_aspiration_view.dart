import 'dart:io';

import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/create_aspiration_view_model.dart';
import 'package:complainz/widgets/app_appbar.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_snackbar.dart';
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
                resetButton(),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: SafeArea(child: complaintButton()),
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
                            // Add image upload functionality here
                            /*   ImagePicker()
                                .pickImage(
                                    source: ImageSource.camera,
                                    preferredCameraDevice: CameraDevice.rear)
                                .then((value) {
                              setState(() {
                                image = value;
                              });
                            }); */
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
                            // Add file upload functionality here
                            /* ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              setState(() {
                                image = value;
                              });
                            }); */
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
          /* const SizedBox(height: AppSizes.padding),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: image == null ? Colors.blue : null,
                image: image != null
                    ? DecorationImage(
                        image: FileImage(
                          File(image!.path),
                        ),
                      )
                    : null),
          ), */
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

/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CreateAspirationView extends StatefulWidget {
  const CreateAspirationView({super.key});

  @override
  State<CreateAspirationView> createState() => _CreateAspirationViewState();
}

class _CreateAspirationViewState extends State<CreateAspirationView> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  int? tag;
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding, vertical: AppSizes.padding),
            child: Column(
              children: [
                const AppBackButton(
                    text: 'Aspirasi',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: AppSizes.padding),
                form(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: complaintButton()),
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
          value: 1,
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
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding / 2, vertical: AppSizes.padding * 2),
      child: AppButton(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/bottom-avbar');
        },
        text: 'Kirim',
        height: 45,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
 */
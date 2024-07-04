import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/home/home_view.dart';
import 'package:complainz/view_model/register_form_view_model.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:complainz/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  /*  bool _passwordVisible = false;
  bool buttonActive = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            children: [
              registerText(),
              //sconst SizedBox(height: AppSizes.padding),
              form(),
              const SizedBox(height: AppSizes.padding),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mulai Laporkan Keadaan Terkini Bersama Complainz',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.padding / 2.5),
          Text(
            'Bergabung, dengan Complainz untuk kemudahan menyampaikan pengaduan!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            //textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Consumer<RegisterFormViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.usernameController,
            hintText: 'Username',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.emailController,
            hintText: 'Email',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.phoneController,
            hintText: 'No Handphone',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            suffixIcon: true,
            controller: model.passwordController,
            obscureText: true,
            hintText: 'Password',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            suffixIcon: true,
            controller: model.confirmPasswordController,
            obscureText: true,
            hintText: 'Ulangi Password',
          ),
        ],
      );
    });
  }

  Widget registerButton() {
    return Consumer<RegisterFormViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          AppButton(
            text: 'Daftar',
            height: 50,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            onTap: () async {
              FocusScope.of(context).unfocus();

              final navigator = Navigator.of(context);
              await model.onRegister(navigator);
              /* final navigator = Navigator.of(context);
              //AppDialog.showDialogProgress(navigator);

              final provider =
                  Provider.of<RegisterFormViewModel>(context, listen: false);
              await provider.createRegisterUser(
                username: model.usernameController.text,
                email: model.emailController.text,
                phone: model.phoneController.text,
                password: model.passwordController.text,
                confirm_password: model.passwordController.text,
              );

              navigator.pop();
              /*  if (provider.isLoadingUser) {
                  AppDialog.showErrorDialog(navigator,
                      title: 'Oops', message: 'Gagal Cuy');
                } else {
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const AuthView()),
                      (Route<dynamic> route) => false);
                }  */

              if (provider.isLoadingUser) {
                setState(() {});
              }
              if (!provider.isLoadingUser && !provider.isRegisterUser) {
                setState(() {});
                AppDialog.showErrorDialog(navigator);
                /* ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Register Gagal"))); */
              }
              if (!provider.isLoadingUser && provider.isRegisterUser) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Register Berhasil")));
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const HomeView();
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(
                          begin: const Offset(2, 0),
                          end: Offset.zero,
                        );
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      }),
                );
              } */
            },
          ),
          const SizedBox(height: AppSizes.padding),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Belum Punya Akun? ',
                  style: TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Masuk',
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

/* Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 56,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor,
                              ),
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              obscureText: _passwordVisible,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 56,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor,
                              ),
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Ulangi Password',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              obscureText: _passwordVisible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), */

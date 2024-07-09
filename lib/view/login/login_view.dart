import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/login_form_view_model.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginFormViewModel? loginFormViewModel;
  //LoginFormViewModel loginFormViewModel = Provider.of<LoginFormViewModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    loginFormViewModel =
        Provider.of<LoginFormViewModel>(context, listen: false);
    passwordVisible = true;
    loginFormViewModel!.usernameController = TextEditingController();
    loginFormViewModel!.passwordController = TextEditingController();
  }

  @override
  void dispose() {
    loginFormViewModel!.usernameController.dispose();
    loginFormViewModel!.passwordController.dispose();
    //loginFormViewModel!.dispose();
    super.dispose();
  }

  bool passwordVisible = true;

  //form validator
  bool isSubmit = false;
  List isHasError = [];

  void checkFieldError() {
    isSubmit = true;
    isHasError = [
      usernameErorText(),
      //passwordErrorText(),
    ];
  }

  String? usernameErorText() {
    loginFormViewModel =
        Provider.of<LoginFormViewModel>(context, listen: false);
    if (!isSubmit) {
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: loginFormViewModel,
      child: Consumer<LoginFormViewModel>(builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.padding),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(),
                  const SizedBox(height: AppSizes.padding * 2),
                  form(),
                  const SizedBox(height: AppSizes.padding),
                  loginButton(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget text() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 3),
      child: Column(
        children: [
          Image.asset(
            'assets/images/images_logo.png',
            width: 80,
            height: 80,
          ),
          const Text(
            'Selamat Datang Kembali',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Laporkan keadaan terkini.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          /*   const Text(
            'Complainz sudah menantikan kamu, \nayo mulai laporkan keadaan terkini.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ), */
        ],
      ),
    );
  }

  Widget form() {
    return Consumer<LoginFormViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
            child: AppTextField(
              controller: model.usernameController,
              hintText: 'Username/Email',
              borderRadius: AppSizes.radius * 1.5,
              rounded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
            child: AppTextField(
              hintText: 'Password',
              suffixIcon: true,
              controller: model.passwordController,
              borderRadius: AppSizes.radius * 1.5,
              rounded: false,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lupa Password?',
                        style: TextStyle(
                          color: AppColors.font,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

Widget loginButton() {
  return Consumer<LoginFormViewModel>(builder: (context, model, _) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
      child: Column(
        children: [
          AppButton(
            text: 'Masuk',
            height: 45,
            fontWeight: FontWeight.w700,
            onTap: () async {
              FocusScope.of(context).unfocus();
              final navigator = Navigator.of(context);

              model.onLogin(navigator, context);
              /* final navigator = Navigator.of(context);
                AppDialog.showDialogProgress(navigator);

                LoginFormViewModel provider =
                    Provider.of<LoginFormViewModel>(context, listen: false);
                await provider.onLogin(
                    username: model.usernameController.text,
                    password: model.passwordController.text);

                navigator.pop();
                if (provider.isLoading) {
                  setState(() {});
                }
                if (!provider.isLoading && !provider.isLogin) {
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Username atau password salah")));
                }
                if (!provider.isLoading && provider.isLogin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Berhasil")));
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const BottomNavbar();
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
              /* final navigator = Navigator.of(context);
                AppDialog.showDialogProgress(navigator);

                LoginFormViewModel login =
                    Provider.of<LoginFormViewModel>(context, listen: false);
                await login.onLogin(
                  username: model.usernameController.text,
                  password: model.usernameController.text,
                );
                navigator.pop();

                if (login.isLoading) {
                  setState(() {});
                }
                if (!login.isLoading && login.isLogin) {
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Username atau password salah")));
                }
                if (!login.isLoading && login.isLogin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Berhasil")));
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const BottomNavbar();
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
                  text: 'Belum Punya Akun, ',
                  style: TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Daftar Sekarang',
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  });
}

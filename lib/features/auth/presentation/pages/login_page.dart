import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/common/widgets/loader.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';
import 'package:cake_shop/core/utils/show_snackbar.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_button.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state is AuthFailure){
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  if(state is AuthLoading){
                    return const Loader();
                  }
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('login.login'.tr(),
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 30),
                        AuthField(
                          hintText: 'login.email'.tr(),
                          controller: emailController,
                        ),
                        const SizedBox(height: 15),
                        AuthField(
                          hintText: 'login.password'.tr(),
                          controller: passwordController,
                          isObscureText: true,
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () =>
                              context.router.push(const ResetPasswordRoute()),
                          child: Text('login.forget_password'.tr()),
                        ),
                        const SizedBox(height: 20),
                        AuthButton(
                          buttonText: 'login.login'.tr(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // For dismiss keyboard
                              FocusScope.of(context).unfocus();
                              context.read<AuthBloc>().add(AuthLoginEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            context.router.push(const RegisterRoute());
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'login.dont_have_account'.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                TextSpan(
                                    text: 'register.register'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(),
                        ),
                        const SizedBox(height: 20),
                        AuthButton(
                          buttonText: 'login.continue_google'.tr(),
                          svgIconPath: 'assets/icons/google.svg',
                          onPressed: () {
                            // For dismiss keyboard
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

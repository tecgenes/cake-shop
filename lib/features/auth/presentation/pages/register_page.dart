import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/common/widgets/loader.dart';
import 'package:cake_shop/core/utils/show_snackbar.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_button.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
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
                        Text('register.register'.tr(),
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: 30),
                        AuthField(
                          hintText: 'register.first_name'.tr(),
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 15),
                        AuthField(
                          hintText: 'register.last_name'.tr(),
                          controller: lastNameController,
                        ),
                        const SizedBox(height: 15),
                        AuthField(
                          hintText: 'register.mobile'.tr(),
                          controller: mobileController,
                        ),
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 20),
                        AuthButton(
                          buttonText: 'register.register'.tr(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthRegisterEvent(
                                      firstName:
                                          firstNameController.text.trim(),
                                      lastName: lastNameController.text.trim(),
                                      mobile: mobileController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                            }
                            // For dismiss keyboard
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            context.router.maybePop();
                            // For dismiss keyboard
                            FocusScope.of(context).unfocus();
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'register.have_account'.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                TextSpan(
                                    text: 'login.login'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        )),
                              ],
                            ),
                          ),
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

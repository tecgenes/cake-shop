import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/common/widgets/loader.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';
import 'package:cake_shop/core/utils/show_snackbar.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:cake_shop/features/auth/presentation/widgets/app_primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
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
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 30),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: firstNameController,
                keyboardType: TextInputType.text,
                validator:
                ValidationBuilder(localeName: context.locale.languageCode)
                    .required()
                    .build(),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'register.first_name'.tr(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: lastNameController,
                keyboardType: TextInputType.text,
                validator: ValidationBuilder(
                  localeName: context.locale.languageCode,
                ).required().build(),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'register.last_name'.tr(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: mobileController,
                keyboardType: TextInputType.text,
                validator: ValidationBuilder(
                  localeName: context.locale.languageCode,
                ).required().build(),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'register.mobile'.tr(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: ValidationBuilder(
                  localeName: context.locale.languageCode,
                ).required().build(),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'login.email'.tr(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                keyboardType: TextInputType.text,
                validator: ValidationBuilder(
                  localeName: context.locale.languageCode,
                ).required().build(),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'login.password'.tr(),
                ),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
                buttonText: 'register.register'.tr(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // For dismiss keyboard
                    FocusScope.of(context).unfocus();
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
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.router.push(const RegisterRoute());
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
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

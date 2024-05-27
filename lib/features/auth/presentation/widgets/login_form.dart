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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              Text('login.login'.tr(),
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 30),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator:
                    ValidationBuilder(localeName: context.locale.languageCode)
                        .email()
                        .required()
                        .build(),
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
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'login.password'.tr(),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => context.router.push(const ResetPasswordRoute()),
                child: Text('login.forget_password'.tr()),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
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
                              .copyWith(color: Theme.of(context).primaryColor)),
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
              AppPrimaryButton(
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
    );
  }
}

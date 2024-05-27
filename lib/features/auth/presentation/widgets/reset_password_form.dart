import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/features/auth/presentation/widgets/app_primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'reset_password.reset_password'.tr(),
              style: Theme.of(context).textTheme.headlineLarge
          ),
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
          const SizedBox(height: 20),
          AppPrimaryButton(
            buttonText: 'reset_password.reset'.tr(),
            onPressed: () {
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
                text: 'reset_password.remember_my_password'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      text: 'login.login'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!.copyWith(color: Theme.of(context).primaryColor)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

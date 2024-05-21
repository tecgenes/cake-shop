import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_button.dart';
import 'package:cake_shop/features/auth/presentation/widgets/auth_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
   const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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
              child: Form(
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
                    AuthField(
                      hintText: 'login.email'.tr(),
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    AuthButton(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/features/auth/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ResetPasswordForm()
            ),
          ),
        ),
      ),
    );
  }
}

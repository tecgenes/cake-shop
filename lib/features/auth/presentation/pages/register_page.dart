import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/features/auth/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});
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
              child: RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}

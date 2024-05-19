import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:cake_shop/features/account/presentation/manager/theme/theme_mode_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Account Page"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.router.push(const UserOrdersRoute()),
                  child: const Text("User Orders Page"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.router.push(const UserProfileRoute()),
                  child: const Text("User Profile Page"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.locale == const Locale('en')
                    ? context.setLocale(context.supportedLocales[0])
                    : context.setLocale(context.supportedLocales[1]);
              },
              child: const Text("Change Language"),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeModeCubit>(context).toggleTheme();
              },
              child: const Text("Change Theme"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';
import 'package:cake_shop/features/auth/presentation/widgets/app_primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class UnAuthPage extends StatelessWidget {
  const UnAuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Text(
                'unauth.${context.routeData.meta['title']}'.tr(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Expanded(
              flex: 3,
              child: SvgPicture.asset(
                context.routeData.meta['imagePath'],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'unauth.${context.routeData.meta['description']}'.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'unauth.auth_requred'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 30,
            ),
            AppPrimaryButton(
              buttonText: 'login.login'.tr(),
              onPressed: () {
                context.router.push(const LoginRoute());
              },
            )
          ],
        ),
      )),
    );
  }
}

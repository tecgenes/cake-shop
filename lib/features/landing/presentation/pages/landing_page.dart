import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io' show Platform, exit;

@RoutePage()
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthUserIsLoggedInEvent());
  }
  @override
  Widget build(BuildContext context) {
    willPop() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(
            'alert.exit_alert'.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            'alert.exit_description'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            ElevatedButton(
                onPressed: () =>
                    Platform.isAndroid ? SystemNavigator.pop() : exit(0),
                child: Text(
                  'alert.exit'.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            ElevatedButton(
                onPressed: () => context.router.maybePop(),
                child: Text(
                  'alert.cancel'.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ],
        ),
      );
    }

    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        BrowseRoute(),
        DesignRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return PopScope(
          canPop: false,
          onPopInvoked: ((didPop) {
            didPop ? null : willPop();
          }),
          child: SafeArea(
              child: Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) => tabsRouter.setActiveIndex(value),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Iconsax.home), label: 'home.home'.tr()),
                BottomNavigationBarItem(
                    icon: const Icon(Iconsax.shop),
                    label: 'browse.browse'.tr()),
                BottomNavigationBarItem(
                    icon: const Icon(Iconsax.designtools),
                    label: 'design.design'.tr()),
                BottomNavigationBarItem(
                    icon: const Icon(Iconsax.personalcard),
                    label: 'account.account'.tr()),
              ],
            ),
          )),
        );
      },
    );
  }
}

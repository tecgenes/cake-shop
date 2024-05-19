import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        BrowseRoute(),
        DesignRoute(),
        AccountRoute(),
      ],
      builder: (context, child){
        final tabsRouter = AutoTabsRouter.of(context);
        return SafeArea(
            child: Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (value) => tabsRouter.setActiveIndex(value),
                items:  [
                  BottomNavigationBarItem(icon: const Icon(Iconsax.home), label: 'home.home'.tr()),
                  BottomNavigationBarItem(icon: const Icon(Iconsax.shop), label: 'browse.browse'.tr()),
                  BottomNavigationBarItem(icon: const Icon(Iconsax.designtools), label: 'design.design'.tr()),
                  BottomNavigationBarItem(icon: const Icon(Iconsax.personalcard), label: 'account.account'.tr()),
                ],
              ),
            )
        );
      },
    );
  }
}

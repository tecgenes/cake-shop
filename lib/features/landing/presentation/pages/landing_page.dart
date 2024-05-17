import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:flutter/material.dart';

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
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Browse"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Design"),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
                ],
              ),
            )
        );
      },
    );
  }
}

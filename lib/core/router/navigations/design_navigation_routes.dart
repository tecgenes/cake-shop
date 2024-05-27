import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';
import 'package:cake_shop/core/router/guard/auth_guard.dart';

AutoRoute designNavigationRoutes = AutoRoute(
  page: DesignNavigation.page,
  children: [
    AutoRoute(page: UnAuthRoute.page, meta: const {
      'imagePath': 'assets/images/design_cake.svg',
      'title' : 'design_title',
      'description': 'design_description',
    }),
    AutoRoute(page: DesignRoute.page, initial: true, guards: [AuthGuard()]),
    // Location Page Route ////////////////////////
    CustomRoute(
        page: LocationRoute.page,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        guards: [AuthGuard()]),
  ],
);

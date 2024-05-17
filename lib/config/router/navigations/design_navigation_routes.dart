import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';

AutoRoute designNavigationRoutes =  AutoRoute(
  page: DesignNavigation.page,
  children: [
    AutoRoute(page: DesignRoute.page, initial: true),
    // Location Page Route ////////////////////////
    CustomRoute(
      page: LocationRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),],
);
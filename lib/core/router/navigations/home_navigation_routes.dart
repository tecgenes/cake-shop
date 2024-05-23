import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';

AutoRoute homeNavigationRoutes =   AutoRoute(
  page: HomeNavigation.page,
  children: [
    AutoRoute(page: HomeRoute.page, initial: true),
    CustomRoute(
      page: CategoryRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    // AutoRoute(page: CategoryRoute.page),
    CustomRoute(
      page: OfferRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),

    // Place Order Route ////////////////////////
    CustomRoute(
      page: PlaceOrderRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    // Location Page Route ////////////////////////
    CustomRoute(
      page: LocationRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    // Product Detail Page Route ////////////////////////
    CustomRoute(
      page: ProductDetailRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
  ],
);
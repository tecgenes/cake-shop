import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';

AutoRoute browseNavigationRoutes =  AutoRoute(
    page: BrowseNavigation.page,
    children: [
      AutoRoute(page: BrowseRoute.page, initial: true),
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
    ]
);
import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';

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
    ]
);
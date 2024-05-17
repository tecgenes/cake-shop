import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/navigations/account_navigation_routes.dart';
import 'package:cake_shop/config/router/navigations/browse_navigation_routes.dart';
import 'package:cake_shop/config/router/navigations/design_navigation_routes.dart';
import 'package:cake_shop/config/router/navigations/home_navigation_routes.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, initial: true, children: [
          // Home Page Routes
          homeNavigationRoutes,
          // Browse Page Routes
          browseNavigationRoutes,
          // Design Page Routes
          designNavigationRoutes,
          // Account Page Routes
          accountNavigationRoutes,
        ]),
      ];
}

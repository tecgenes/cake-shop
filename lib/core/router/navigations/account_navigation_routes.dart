import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';

AutoRoute accountNavigationRoutes = AutoRoute(
  page: AccountNavigation.page,
  children: [
    AutoRoute(page: AccountRoute.page, initial: true),
    CustomRoute(
      page: UserProfileRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    CustomRoute(
      page: UserOrdersNavigation.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      children: [
        CustomRoute(
          page: UserOrdersRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        ),
        CustomRoute(
          page: OrderDetailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        )
      ],
    ),
  ],
);
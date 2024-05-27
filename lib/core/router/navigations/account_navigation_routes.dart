import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';
import 'package:cake_shop/core/router/guard/auth_guard.dart';

AutoRoute accountNavigationRoutes = AutoRoute(
  page: AccountNavigation.page,
  children: [
    AutoRoute(page: UnAuthRoute.page, meta: const {
      'imagePath': 'assets/images/access_account.svg',
      'title' : 'account_title',
      'description': 'account_descriprtion',
    }),
    AutoRoute(page: AccountRoute.page, initial: true, guards: [AuthGuard()]),
    CustomRoute(
      page: UserProfileRoute.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: UserOrdersNavigation.page,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      guards: [AuthGuard()],
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

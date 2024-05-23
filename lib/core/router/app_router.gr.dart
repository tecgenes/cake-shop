// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:cake_shop/features/account/presentation/account_navigation.dart'
    as _i1;
import 'package:cake_shop/features/account/presentation/pages/account_page.dart'
    as _i2;
import 'package:cake_shop/features/auth/presentation/pages/login_page.dart'
    as _i12;
import 'package:cake_shop/features/auth/presentation/pages/register_page.dart'
    as _i17;
import 'package:cake_shop/features/auth/presentation/pages/reset_password_page.dart'
    as _i18;
import 'package:cake_shop/features/browse/presentation/browse_navigation.dart'
    as _i3;
import 'package:cake_shop/features/browse/presentation/pages/browse_page.dart'
    as _i4;
import 'package:cake_shop/features/category/presentation/pages/category_page.dart'
    as _i5;
import 'package:cake_shop/features/design/presentation/design_navigation.dart'
    as _i6;
import 'package:cake_shop/features/design/presentation/pages/design_page.dart'
    as _i7;
import 'package:cake_shop/features/home/presentation/home_navigation.dart'
    as _i8;
import 'package:cake_shop/features/home/presentation/pages/home_page.dart'
    as _i9;
import 'package:cake_shop/features/location/presentation/pages/location_page.dart'
    as _i11;
import 'package:cake_shop/features/offer/presentation/pages/offer_page.dart'
    as _i13;
import 'package:cake_shop/features/order_detail/presentation/pages/order_detail_page.dart'
    as _i14;
import 'package:cake_shop/features/place_order/presentation/pages/place_order_page.dart'
    as _i15;
import 'package:cake_shop/features/product_detail/presentation/pages/product_detail_page.dart'
    as _i16;
import 'package:cake_shop/features/user_orders/presentation/pages/user_orders_page.dart'
    as _i20;
import 'package:cake_shop/features/user_orders/presentation/user_orders_navigation.dart'
    as _i19;
import 'package:cake_shop/features/user_profile/presentation/pages/user_profile_page.dart'
    as _i21;
import 'package:cake_shop/landing_page.dart' as _i10;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AccountNavigation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountNavigation(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountPage(),
      );
    },
    BrowseNavigation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BrowseNavigation(),
      );
    },
    BrowseRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BrowsePage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CategoryPage(),
      );
    },
    DesignNavigation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DesignNavigation(),
      );
    },
    DesignRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DesignPage(),
      );
    },
    HomeNavigation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeNavigation(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LandingPage(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LocationPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LoginPage(),
      );
    },
    OfferRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OfferPage(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.OrderDetailPage(),
      );
    },
    PlaceOrderRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PlaceOrderPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProductDetailPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RegisterPage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ResetPasswordPage(),
      );
    },
    UserOrdersNavigation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.UserOrdersNavigation(),
      );
    },
    UserOrdersRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.UserOrdersPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.UserProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountNavigation]
class AccountNavigation extends _i22.PageRouteInfo<void> {
  const AccountNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          AccountNavigation.name,
          initialChildren: children,
        );

  static const String name = 'AccountNavigation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountPage]
class AccountRoute extends _i22.PageRouteInfo<void> {
  const AccountRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BrowseNavigation]
class BrowseNavigation extends _i22.PageRouteInfo<void> {
  const BrowseNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          BrowseNavigation.name,
          initialChildren: children,
        );

  static const String name = 'BrowseNavigation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BrowsePage]
class BrowseRoute extends _i22.PageRouteInfo<void> {
  const BrowseRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BrowseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BrowseRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CategoryPage]
class CategoryRoute extends _i22.PageRouteInfo<void> {
  const CategoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DesignNavigation]
class DesignNavigation extends _i22.PageRouteInfo<void> {
  const DesignNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          DesignNavigation.name,
          initialChildren: children,
        );

  static const String name = 'DesignNavigation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DesignPage]
class DesignRoute extends _i22.PageRouteInfo<void> {
  const DesignRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DesignRoute.name,
          initialChildren: children,
        );

  static const String name = 'DesignRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeNavigation]
class HomeNavigation extends _i22.PageRouteInfo<void> {
  const HomeNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          HomeNavigation.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LandingPage]
class LandingRoute extends _i22.PageRouteInfo<void> {
  const LandingRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LocationPage]
class LocationRoute extends _i22.PageRouteInfo<void> {
  const LocationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginPage]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OfferPage]
class OfferRoute extends _i22.PageRouteInfo<void> {
  const OfferRoute({List<_i22.PageRouteInfo>? children})
      : super(
          OfferRoute.name,
          initialChildren: children,
        );

  static const String name = 'OfferRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrderDetailPage]
class OrderDetailRoute extends _i22.PageRouteInfo<void> {
  const OrderDetailRoute({List<_i22.PageRouteInfo>? children})
      : super(
          OrderDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PlaceOrderPage]
class PlaceOrderRoute extends _i22.PageRouteInfo<void> {
  const PlaceOrderRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PlaceOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProductDetailPage]
class ProductDetailRoute extends _i22.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProductDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RegisterPage]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ResetPasswordPage]
class ResetPasswordRoute extends _i22.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.UserOrdersNavigation]
class UserOrdersNavigation extends _i22.PageRouteInfo<void> {
  const UserOrdersNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          UserOrdersNavigation.name,
          initialChildren: children,
        );

  static const String name = 'UserOrdersNavigation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UserOrdersPage]
class UserOrdersRoute extends _i22.PageRouteInfo<void> {
  const UserOrdersRoute({List<_i22.PageRouteInfo>? children})
      : super(
          UserOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserOrdersRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.UserProfilePage]
class UserProfileRoute extends _i22.PageRouteInfo<void> {
  const UserProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

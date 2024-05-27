import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/core/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    const auth = true;
    if(auth){
      resolver.next(true);
    }else{
      resolver.redirect(const UnAuthRoute());
    }
  }

}
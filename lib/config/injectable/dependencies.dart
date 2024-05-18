import 'package:cake_shop/config/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';

class Dependencies{
  static final inject = GetIt.instance;
  static Future<void> init() async {
    // Localization       ///////////////////////////////
    inject.registerFactory(() => EasyLocalization.ensureInitialized());
    // Routes        ///////////////////////////////
    inject.registerFactory(() => AppRouter());

    // Blocs        ///////////////////////////////

    // Usecases     ///////////////////////////////

    // Repositories ///////////////////////////////

    // Datasources ///////////////////////////////


  }
}




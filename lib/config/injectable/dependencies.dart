import 'package:cake_shop/config/router/app_router.dart';
import 'package:cake_shop/features/account/data/local/data_sources/theme_local_datasource.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    // Remote Datasources ///////////////////////////////
    inject.registerLazySingletonAsync(() =>  SharedPreferences.getInstance());

    // Local Datasources ///////////////////////////////
  }
}




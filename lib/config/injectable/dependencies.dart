import 'package:cake_shop/config/router/app_router.dart';
import 'package:cake_shop/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:cake_shop/features/auth/data/repositories/auth_repository.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:cake_shop/features/auth/domain/use_cases/current_user_usecase.dart';
import 'package:cake_shop/features/auth/domain/use_cases/user_login_usecase.dart';
import 'package:cake_shop/features/auth/domain/use_cases/user_register_usecase.dart';
import 'package:cake_shop/features/auth/presentation/manager/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final inject = GetIt.instance;
Future<void> init() async {
  await dotenv.load(fileName: ".env");
  final supabase = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  // Supabase Client  /////////////////////////////
  inject.registerLazySingleton(() => supabase.client);
  // Localization       ///////////////////////////////
  inject.registerFactory(() => EasyLocalization.ensureInitialized());
  // Routes        ///////////////////////////////
  inject.registerFactory(() => AppRouter());

  inject.registerLazySingletonAsync(() => SharedPreferences.getInstance());

  _initAuth();
}

void _initAuth() {
  inject
  // Datasources ///////////////////////////////
    ..registerFactory<AuthRemoteDatasourceInterface>(
            () => AuthSupabaseImplementation(inject()))
  // Repositories ///////////////////////////////
    ..registerFactory<AuthRepositoryInterface>(() => AuthRepository(inject()))
  // Usecases     ///////////////////////////////
    ..registerFactory(() => UserRegisterUsecase(inject()))
    ..registerFactory(() => UserLoginUsecase(inject()))
    ..registerFactory(() => CurrentUserUsecase(inject()))
  // Blocs        ///////////////////////////////
    ..registerLazySingleton(() => AuthBloc(
      userRegisterUsecase: inject(),
      userLoginUsecase: inject(),
      currentUserUsecase: inject(),
    ));
}

import 'package:cake_shop/core/contracts/auth_remote_datasource.dart';
import 'package:cake_shop/core/router/app_router.dart';
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

final dependency = GetIt.instance;
Future<void> initialize() async {
  // environment variables  /////////////////////////////
  await dotenv.load(fileName: ".env");
  // Supabase Initialization  /////////////////////////////
  final supabase = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  // Supabase Client  /////////////////////////////
  dependency.registerLazySingleton(() => supabase.client);
  // Localization       ///////////////////////////////
  dependency.registerFactory(() => EasyLocalization.ensureInitialized());
  // Routes        ///////////////////////////////
  dependency.registerFactory(() => AppRouter());

  dependency.registerLazySingletonAsync(() => SharedPreferences.getInstance());

  _initAuth();
}

void _initAuth() {
  dependency
  // Datasources ///////////////////////////////
    ..registerFactory<AuthRemoteDatasourceInterface>(
            () => AuthSupabaseImplementation(dependency()))
  // Repositories ///////////////////////////////
    ..registerFactory<AuthRepositoryInterface>(() => AuthRepository(dependency()))
  // Usecases     ///////////////////////////////
    ..registerFactory(() => UserRegisterUsecase(dependency()))
    ..registerFactory(() => UserLoginUsecase(dependency()))
    ..registerFactory(() => CurrentUserUsecase(dependency()))
  // Blocs        ///////////////////////////////
    ..registerLazySingleton(() => AuthBloc(
      userRegisterUsecase: dependency(),
      userLoginUsecase: dependency(),
      currentUserUsecase: dependency(),
    ));
}

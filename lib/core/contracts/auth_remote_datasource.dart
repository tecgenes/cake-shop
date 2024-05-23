import 'package:cake_shop/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasourceInterface {
  Session? get currentUserSession;
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}
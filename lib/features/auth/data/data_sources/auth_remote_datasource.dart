import 'package:cake_shop/core/contracts/auth_remote_datasource.dart';
import 'package:cake_shop/core/errors/exceptions.dart';
import 'package:cake_shop/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseImplementation implements AuthRemoteDatasourceInterface {
  final SupabaseClient supabaseClient;

  AuthSupabaseImplementation(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException("No user found!!");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<UserModel> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signUp(email: email, password: password, data: {
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
      });
      if (response.user == null) {
        throw ServerException("No user found!!");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if(currentUserSession != null){
       final userData = await supabaseClient.from('profiles').select().eq(
          'id',
          currentUserSession!.user.id,
        );
       return UserModel.fromJson(userData.first).copyWith(
         email: currentUserSession!.user.email
       );
      }
      return null;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

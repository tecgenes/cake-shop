import 'package:cake_shop/core/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit() : super(CurrentUserInitial());

  void updateUser(UserEntity? user){
    if(user == null){
      emit(CurrentUserInitial());
    }else{
      emit(CurrentUserLoggedIn(user));
    }
  }
}

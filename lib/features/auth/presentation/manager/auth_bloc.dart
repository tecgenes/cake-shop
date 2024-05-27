import 'package:cake_shop/core/contracts/usecase.dart';
import 'package:cake_shop/core/cubits/current_user/current_user_cubit.dart';
import 'package:cake_shop/core/dtos/user_login_dto.dart';
import 'package:cake_shop/core/dtos/user_register_dto.dart';
import 'package:cake_shop/core/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/use_cases/current_user_usecase.dart';
import 'package:cake_shop/features/auth/domain/use_cases/user_login_usecase.dart';
import 'package:cake_shop/features/auth/domain/use_cases/user_register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRegisterUsecase _userRegisterUsecase;
  final UserLoginUsecase _userLoginUsecase;
  final CurrentUserUsecase _currentUserUsecase;
  final CurrentUserCubit _currentUserCubit;
  AuthBloc({
    required UserRegisterUsecase userRegisterUsecase,
    required UserLoginUsecase userLoginUsecase,
    required CurrentUserUsecase currentUserUsecase,
    required CurrentUserCubit currentUserCubit,
  })  : _userRegisterUsecase = userRegisterUsecase,
        _userLoginUsecase = userLoginUsecase,
        _currentUserUsecase = currentUserUsecase,
        _currentUserCubit = currentUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthRegisterEvent>(_onAuthRegister);
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthUserIsLoggedInEvent>(_isUserLoggedIn);
  }

  void _onAuthRegister(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    final response = await _userRegisterUsecase(
      UserRegisterDTO(
        firstName: event.firstName,
        lastName: event.lastName,
        mobile: event.mobile,
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    final response = await _userLoginUsecase(UserLoginDTO(
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _isUserLoggedIn(
      AuthUserIsLoggedInEvent event, Emitter<AuthState> emit) async {
    final response = await _currentUserUsecase(NeedlessDTO());
    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _emitAuthSuccess(UserEntity user, Emitter<AuthState> emit) async {
    _currentUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}

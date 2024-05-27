part of 'current_user_cubit.dart';

@immutable
sealed class CurrentUserState {}

final class CurrentUserInitial extends CurrentUserState {}

final class CurrentUserLoggedIn extends CurrentUserState{
  final UserEntity user;
  CurrentUserLoggedIn(this.user);
}

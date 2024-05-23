class UserRegisterDTO {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String password;

  UserRegisterDTO({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.password,
  });
}
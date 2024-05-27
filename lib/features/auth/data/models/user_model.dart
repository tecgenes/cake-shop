import 'package:cake_shop/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.mobile,
      required super.email});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      mobile: map['mobile'] ?? '',
      email: map['email'] ?? '',
    );
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
    );
  }
}

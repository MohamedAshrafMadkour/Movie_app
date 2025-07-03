import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.email,
    required super.name,
    required super.image,
    required super.birthday,
  });

  Map<String, dynamic> toEntity() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'image': image,
      'birthday': birthday,
    };
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? " ",
      name: user.displayName ?? " ",
      uid: user.uid,
      image: user.photoURL ?? " ",
      birthday: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'image': image,
      'birthday': birthday,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
      birthday: json['birthday'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      name: user.name,
      image: user.image,
      birthday: user.birthday,
    );
  }
}

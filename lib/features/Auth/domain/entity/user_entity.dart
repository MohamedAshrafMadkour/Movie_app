class UserEntity {
  final String uid;
  final String email;
  final String? name;
  final String? image;
  final String? birthday;

  UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    required this.image,
    required this.birthday,
  });
}

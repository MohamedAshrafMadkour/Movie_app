import 'dart:convert';
import 'dart:developer';

import 'package:movie_app/core/constants/local_storage_key.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/features/Auth/data/model/user_model.dart';

UserModel getUser() {
  final userData = PrefStorage.getString(LocalStorageKey.setDataUser);
  if (userData.trim().isEmpty) {
    return UserModel(birthday: '', email: '', image: '', name: '', uid: '');
  }
  try {
    var user = jsonDecode(userData);
    log("User data: $user");
    return UserModel.fromJson(user);
  } catch (e) {
    print("Error parsing user JSON: $e");
    return UserModel(birthday: '', email: '', image: '', name: '', uid: '');
  }
}

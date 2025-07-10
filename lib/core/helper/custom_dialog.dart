import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';

Future<void> customDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: Text(
          'Logout Confirmation',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Log Out', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              Navigator.of(context).pop();
              await FirebaseAuth.instance.signOut();
              PrefStorage.remove(AllKeys.setDataUser);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
          ),
        ],
      );
    },
  );
}

Future<dynamic> customRegisterDialog(
  BuildContext context, {
  required String email,
  required String password,
  required String birthday,
  required String confirmPassword,
}) {
  final registerCubit = context.read<RegisterCubit>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: registerCubit,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Terms and Conditions',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            'Do you accept the terms and conditions?',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Accept', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                registerCubit.register(
                  email: email,
                  password: password,
                  birthday: birthday,
                  confirmPassword: confirmPassword,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

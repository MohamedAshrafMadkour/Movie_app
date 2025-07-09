import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/helper/get_user_data.dart';
import 'package:movie_app/features/profile/domain/repo/image_repo.dart';
import 'package:movie_app/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.imageRepo, this.profileRepo) : super(ProfileInitial());
  final ImageRepo imageRepo;
  final ProfileRepo profileRepo;
  Future<void> uploadImageAndUpdateName(File file, String name) async {
    emit(ProfileLoading());
    final result = await imageRepo.uploadImage(file);
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.errorMessage)),
      (success) async {
        final uid = getUser().uid;
        final result = await profileRepo.updateUserdata(
          uid: uid,
          name: name,
          imageUrl: success,
        );
        result.fold(
          (failure) => emit(ProfileFailure(message: failure.errorMessage)),
          (r) {
            emit(ProfileSuccess());
          },
        );
      },
    );
  }
}

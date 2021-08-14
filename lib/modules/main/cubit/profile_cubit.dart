import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/repositories/user_repository.dart';
import 'package:base_mobile_indieapps/utils/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    getUserDetail();
  }

  final _repo = UserRepository();

  Future<void> getUserDetail() async {
    emit(ProfileLoading());

    final response = await _repo.getUserDetail();

    if (response.status == ResponseStatus.success) {
      emit(ProfileSuccess(response.data!));
    } else {
      emit(ProfileFailed());
    }
  }
}

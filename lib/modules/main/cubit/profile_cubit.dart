import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    initial();
  }

  final _repo = UserRepository();

  Future<void> initial() async {
    emit(ProfileLoading());
    await fetch();
  }

  Future<void> fetch() async {
    final response = await _repo.fetchUser();

    if (response.statusCode == 200) {
      emit(ProfileSuccess(response.data));
    } else {
      emit(ProfileFailed());
    }
  }
}

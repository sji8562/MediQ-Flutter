import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_info_state.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoViewModel, UserInfoState>(
      (ref) => UserInfoViewModel(),
    );

class UserInfoViewModel extends StateNotifier<UserInfoState> {
  UserInfoViewModel() : super(const UserInfoState());

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateBirthDate(DateTime date) {
    state = state.copyWith(birthDate: date);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }
}

class UserInfoState {
  final String name;
  final DateTime? birthDate;
  final String? gender; // 'M' | 'F'

  const UserInfoState({this.name = '', this.birthDate, this.gender});

  bool get isValid => name.isNotEmpty && birthDate != null && gender != null;

  UserInfoState copyWith({String? name, DateTime? birthDate, String? gender}) {
    return UserInfoState(
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
    );
  }
}

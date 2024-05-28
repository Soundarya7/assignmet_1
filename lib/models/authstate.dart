class AuthState {
  final String? profilePic;
  final String? username;
  final String? email;
  final String? mobileno;
  final String? gender;

  AuthState({
    this.profilePic,
    this.username,
    this.email,
    this.mobileno,
    this.gender,
  });

  AuthState.fromJson(Map<String, dynamic> json)
    : profilePic = json['profile_pic'] as String?,
      username = json['username'] as String?,
      email = json['email'] as String?,
      mobileno = json['mobileno'] as String?,
      gender = json['gender'] as String?;

  Map<String, dynamic> toJson() => {
    'profile_pic': profilePic,
    'username': username,
    'email': email,
    'mobileno': mobileno,
    'gender': gender,
  };

  AuthState copyWith({
    String? profilePic,
    String? username,
    String? email,
    String? mobileno,
    String? gender,
  }) {
    return AuthState(
      profilePic: profilePic ?? this.profilePic,
      username: username ?? this.username,
      email: email ?? this.email,
      mobileno: mobileno ?? this.mobileno,
      gender: gender ?? this.gender,
    );
  }
}

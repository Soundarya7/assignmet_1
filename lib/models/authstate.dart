class AuthState {
  final String? profilePic;
  final String? username;
  final String? email;
  final String? mobileno;
  final String? gender;
  final String? token;
  final String? usertype;

  AuthState({
    this.profilePic,
    this.username,
    this.email,
    this.mobileno,
    this.gender,
    this.token,
    this.usertype,
  });

  AuthState.fromJson(Map<String, dynamic> json)
    : profilePic = json['profile_pic'] as String?,
      username = json['username'] as String?,
      email = json['email'] as String?,
      mobileno = json['mobileno'] as String?,
      gender = json['gender'] as String?,
      token = json['token'] as String?,
      usertype = json['usertype'] as String?;

  Map<String, dynamic> toJson() => {
    'profile_pic': profilePic,
    'username': username,
    'email': email,
    'mobileno': mobileno,
    'gender': gender,
    'token':token,
    'usertype':usertype
  };

  AuthState copyWith({
    String? profilePic,
    String? username,
    String? email,
    String? mobileno,
    String? gender,
    String? token,
    String? usertype,
  }) {
    return AuthState(
      profilePic: profilePic ?? this.profilePic,
      username: username ?? this.username,
      email: email ?? this.email,
      mobileno: mobileno ?? this.mobileno,
      gender: gender ?? this.gender,
      token: token ?? this.token,
      usertype: usertype ?? this.usertype,
    );
  }
}

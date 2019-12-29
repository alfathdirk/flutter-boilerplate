class PostLogin {
  final bool error;
  final String token;

  PostLogin({this.error, this.token});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
      error: json['error'],
      token: json['token'],
    );
  }
}
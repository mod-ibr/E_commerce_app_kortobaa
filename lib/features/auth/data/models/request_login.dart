class RequestLogin {
  String username;
  String password;

  RequestLogin({
    required this.username,
    required this.password,
  });

  factory RequestLogin.fromJson(Map<String, dynamic> json) => RequestLogin(
        username: json['username'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

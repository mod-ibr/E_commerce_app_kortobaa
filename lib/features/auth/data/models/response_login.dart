class ResponseLogin {
  String accessToken;
  String refreshToken;

  ResponseLogin({
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        accessToken: json['access'] as String,
        refreshToken: json['refresh'] as String,
      );

  Map<String, dynamic> toJson() => {
        'access': accessToken,
        'refresh': refreshToken,
      };
}

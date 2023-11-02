import 'user.dart';

class ResponseRegister {
  User? user;
  String? message;

  ResponseRegister({this.user, this.message});

  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'message': message,
      };
}

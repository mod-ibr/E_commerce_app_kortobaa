class RequestRegister {
  String? username;
  String? password;
  String? email;
  String? firstName;
  String? lastName;

  RequestRegister({
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory RequestRegister.fromJson(Map<String, dynamic> json) {
    return RequestRegister(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
      };
}

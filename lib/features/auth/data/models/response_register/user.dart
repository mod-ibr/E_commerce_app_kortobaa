class User {
  int? id;
  dynamic lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User({
    this.id,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        lastLogin: json['last_login'] as dynamic,
        isSuperuser: json['is_superuser'] as bool?,
        username: json['username'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        isStaff: json['is_staff'] as bool?,
        isActive: json['is_active'] as bool?,
        dateJoined: json['date_joined'] == null
            ? null
            : DateTime.parse(json['date_joined'] as String),
        groups: json['groups'] as List<dynamic>?,
        userPermissions: json['user_permissions'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'last_login': lastLogin,
        'is_superuser': isSuperuser,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'is_staff': isStaff,
        'is_active': isActive,
        'date_joined': dateJoined?.toIso8601String(),
        'groups': groups,
        'user_permissions': userPermissions,
      };
}

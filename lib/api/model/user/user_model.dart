class UserModel {
  String username;
  String name;
  String email;

  UserModel({
    required this.username,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'name': name,
        'email': email,
      };

  bool isFillAttributes() => username.isNotEmpty && name.isNotEmpty && email.isNotEmpty;
}

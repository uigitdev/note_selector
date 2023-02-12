class FriendModel {
  final int id;
  final String name;
  final String username;

  FriendModel({
    required this.id,
    required this.name,
    required this.username,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
      );
}

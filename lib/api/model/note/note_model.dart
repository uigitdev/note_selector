class NoteModel {
  final int userId;
  final int id;
  final String title;
  bool completed;

  NoteModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  void changeCompletedStatus(bool isCompleted) => completed = isCompleted;
}

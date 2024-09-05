class CreateUser {
  final String id;
  final String name;
  final String job;
  final String createdAt;

  CreateUser({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      createdAt: json['createdAt'],
    );
  }
}

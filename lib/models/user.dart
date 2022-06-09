class HubUser {
  String id;
  final String name;
  final String email;
  final String password;

  HubUser({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
      };
  static HubUser fromJson(Map<String, dynamic> json) => HubUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );
}

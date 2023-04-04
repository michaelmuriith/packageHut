class User {
  String? id;
  String fullName;
  String imageUrl;
  String email;
  String password;

  User({
    this.id,
    required this.fullName,
    required this.imageUrl,
    required this.email,
    required this.password,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        imageUrl = data['imageUrl'],
        email = data['email'],
        password = data['password'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'imageUrl': imageUrl,
      'email': email,
      'password': password,
    };
  }
}

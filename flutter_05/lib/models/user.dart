class User {
  int? id;
  String username;
  String password;
  String fullname;
  DateTime dateOfBirth;

  User({this.id,
        required this.username,
        required this.password,
        required this.fullname,
        required this.dateOfBirth,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'username': username,
      'password': password,
      'fullname': fullname,
      'dayOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      fullname: map['fullname'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}

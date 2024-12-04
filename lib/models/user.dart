class User {
  int? id;
  String name;
  String email;
  String phoneNumber;
  bool notificationsEnabled;
  String password;
  String preferences;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.notificationsEnabled,
    required this.password,
    required this.preferences,
  });

  // Convert User instance to a Map (for inserting into database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'notificationsEnabled': notificationsEnabled ? 1 : 0,
      'password': password,
      'preferences': preferences,
    };
  }

  // Convert a Map into a User instance
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      notificationsEnabled: map['notificationsEnabled'] == 1,
      password: map['password'],
      preferences: map['preferences'],
    );
  }
}

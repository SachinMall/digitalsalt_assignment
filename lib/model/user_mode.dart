class UserModel {
  final String email;
  final String firstName;
  final String lastName;

  UserModel({
     this.email = "",
     this.firstName = "",
     this.lastName = "",
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

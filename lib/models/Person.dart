class Person {
  late int id;
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String email;
  late String password;

  Person();

  Person.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'phoneNumber': phoneNumber,
    'email': email,
    'password': password
  };
}
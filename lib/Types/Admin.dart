import 'package:govapp/Types/Departement.dart';

class Admin {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String role;

  List<Departement> departements;

  Admin(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.role,
      required this.departements});

  factory Admin.fromJson(Map<String, dynamic> json) {
    var departementList = json['departements'] as List;
    List<Departement> departements =
        departementList.map((item) => Departement.fromJson(item)).toList();

    return Admin(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      departements: departements,
    );
  }
}

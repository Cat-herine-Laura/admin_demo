import 'package:firebase_database/firebase_database.dart';

class Driver {
  String id;
  String name;
  String email;
  String phone;

  Driver({required this.id, required this.name, required this.email, required this.phone});

  factory Driver.fromSnapshot(DataSnapshot snapshot) {
    return Driver(
      id: snapshot.key ?? '',
      name: snapshot.child('name').value.toString(),
      email: snapshot.child('email').value.toString(),
      phone: snapshot.child('phone').value.toString(),
    );
  }
}

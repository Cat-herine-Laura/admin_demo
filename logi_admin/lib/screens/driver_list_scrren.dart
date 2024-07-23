// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:logi_admin/models/driver_model.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});

  @override
  _DriverListScreenState createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  List<Driver> driversList = [];
  final DatabaseReference driversRef = FirebaseDatabase.instance.ref().child('drivers');

  @override
  void initState() {
    super.initState();
    fetchDrivers();
  }

  void fetchDrivers() {
    driversRef.onValue.listen((event) {
      final List<Driver> loadedDrivers = [];
      for (var child in event.snapshot.children) {
        loadedDrivers.add(Driver.fromSnapshot(child));
      }
      setState(() {
        driversList = loadedDrivers;
      });
    });
  }

  void deleteDriver(String driverId) {
    driversRef.child(driverId).remove().then((_) {
      Fluttertoast.showToast(msg: 'Driver deleted successfully');
    }).catchError((error) {
      Fluttertoast.showToast(msg: 'Error deleting driver: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Drivers'),
      ),
      body: driversList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: driversList.length,
              itemBuilder: (ctx, index) {
                final driver = driversList[index];
                return ListTile(
                  title: Text(driver.name),
                  subtitle: Text(driver.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteDriver(driver.id),
                  ),
                );
              },
            ),
    );
  }
}

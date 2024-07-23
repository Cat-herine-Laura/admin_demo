import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logi_admin/screens/dashboard.dart';
import 'package:logi_admin/screens/driver_list_scrren.dart';
import 'package:logi_admin/screens/trip_order_screen.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:logi_admin/screens/trip_order_screen.dart';
// import 'package:logi_admin/screens/dashboard.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DriverListScreen(),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        "/trips" : (context) => const OrdersScreen(),
        // '/profile':(context) => const ProfileScreen()
        // Add other routes here
      },
    );
  }
}


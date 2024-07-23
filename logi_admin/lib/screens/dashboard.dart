import 'package:flutter/material.dart';
import 'package:logi_admin/screens/driver_list_scrren.dart';
import '../widgets/sidebar.dart'; 

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return const Row(
              children: [
                NavigationSidebar(),
                Expanded(
                  child: DashboardContent(),
                ),
              ],
            );
          } else {
            return Scaffold(
              drawer: const Drawer(
                child: NavigationSidebar(),
              ),
              appBar: AppBar(
                title: const Text('Logistics App'),
              ),
              body: const DashboardContent(),
            );
          }
        },
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Truck Map',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 400,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Map goes here'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Trip Info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Trip info goes here'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'All Drivers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Drivers info goes here'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DriverListScreen()),
    );
  },
  child: const Text('View Drivers'),
),

          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Dashboard Screen')),
    );
  }
}

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Trips Screen')),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Calendar Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Profile Screen')),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Notifications Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Settings Screen')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truck list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const NavigationSidebar(),
      body: Column(
        children: [
          const TruckListSummary(),
          Expanded(
            child: TruckList(
              trucks: [
                Truck('BH 5671 XX', 'Mercedes 412', '2 tons', 'In work', 'Cherkasy', 'Open'),
                Truck('BH 4524 IP', 'Mercedes 413', '2 tons', 'In work', 'Vinnytsia', 'Open'),
                Truck('BH 6211 IT', 'Mercedes 814', '5 tons', 'In work', 'Kyiv', 'Open'),
                Truck('BH 7788 AT', 'Mercedes 814', '5 tons', 'In service', 'Kherson', 'Open'),
                Truck('BH 2650 AB', 'Man 8180', '5 tons', 'Free', 'Kharkov', 'Open'),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: const FilterSection(),
    );
  }
}

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(Icons.local_shipping, color: Colors.orange, size: 30),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  SidebarButton(icon: FontAwesomeIcons.truck, routeName: '/dashboard'),
                  SidebarButton(icon: FontAwesomeIcons.book, routeName: '/trips'),
                  SidebarButton(icon: FontAwesomeIcons.calendarDays, routeName: '/calendar'),
                  SidebarButton(icon: FontAwesomeIcons.gears, routeName: '/settings'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  SidebarButton(icon: FontAwesomeIcons.bell, routeName: '/notifications'),
                  SidebarButton(icon: FontAwesomeIcons.user, routeName: '/profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String routeName;

  const SidebarButton({required this.icon, required this.routeName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: IconButton(
        icon: FaIcon(icon, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}

class TruckListSummary extends StatelessWidget {
  const TruckListSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('10 Total'),
          Text('5 In work'),
          Text('2 In service'),
          Text('3 Free'),
        ],
      ),
    );
  }
}

class TruckList extends StatelessWidget {
  final List<Truck> trucks;

  const TruckList({required this.trucks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trucks.length,
      itemBuilder: (context, index) {
        final truck = trucks[index];
        return TruckListItem(truck: truck);
      },
    );
  }
}

class Truck {
  final String number;
  final String model;
  final String carrying;
  final String status;
  final String location;
  final String availability;

  Truck(this.number, this.model, this.carrying, this.status, this.location, this.availability);
}

class TruckListItem extends StatelessWidget {
  final Truck truck;

  const TruckListItem({required this.truck, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        child: ListTile(
          title: Text(truck.number),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(truck.model),
              Text(truck.carrying),
              Text(truck.status),
              Text(truck.location),
            ],
          ),
          trailing: Chip(
            label: Text(truck.availability),
            backgroundColor: truck.availability == 'Open' ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Carrying capacity'),
          Slider(
            value: 5,
            min: 1,
            max: 10,
            onChanged: (value) {},
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Model'),
          ),
          DropdownButton<String>(
            value: 'In work',
            onChanged: (String? newValue) {},
            items: <String>['In work', 'In service', 'Free']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Location'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}

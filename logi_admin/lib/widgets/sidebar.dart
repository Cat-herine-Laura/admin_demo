import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
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
                SidebarButton(icon: FontAwesomeIcons.calendar, routeName: '/calendar'),
                SidebarButton(icon: FontAwesomeIcons.user, routeName: '/profile'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                SidebarButton(icon: FontAwesomeIcons.bell, routeName: '/notifications'),
                SidebarButton(icon: FontAwesomeIcons.gears, routeName: '/settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String routeName;

  const SidebarButton({super.key, required this.icon, required this.routeName});

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
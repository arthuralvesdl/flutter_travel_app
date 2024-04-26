import 'package:flutte_travel_app/widgets/destination_carousel.dart';
import 'package:flutte_travel_app/widgets/hotel_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : const Color(0xfee7ebee),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.primary
              : const Color(0xffb4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 12.0),
            child: Text(
              'What would you like to find?',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcon(map.key))
                .toList(),
          ),
          const SizedBox(height: 20.0),
          const DestinationCarousel(),
          const SizedBox(height: 20.0),
          const HotelCarousel()
        ],
      )),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        backgroundColor: Colors.transparent,
        selectedIndex: _currentTab,
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "",
              icon: const Icon(Icons.search, color: Colors.grey)),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.local_pizza,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "",
              icon: const Icon(
                Icons.local_pizza,
                color: Colors.grey,
              )),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
              ),
            label: "",
            icon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

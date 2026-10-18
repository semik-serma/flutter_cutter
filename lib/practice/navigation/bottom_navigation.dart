import 'package:flutter/material.dart';

class NavigationBottomDart extends StatefulWidget {
  const NavigationBottomDart({super.key});

  @override
  State<NavigationBottomDart> createState() => _NavigationBottomDartState();
}

class _NavigationBottomDartState extends State<NavigationBottomDart> {
  int selectedIndex = 0;
  final List<Widget> pages = const [
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Order Page")),
    Center(child: Text("Profile Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to practice of bottombar")),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            selectedIcon: Icon(Icons.home, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            label: "Search Item",
            selectedIcon: Icon(Icons.search, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shoppings",
            selectedIcon: Icon(Icons.shopping_bag, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.bike_scooter_outlined),
            label: "Bikes",
            selectedIcon: Icon(Icons.bike_scooter, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

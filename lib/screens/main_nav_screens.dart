import 'package:flutter/material.dart';
import 'package:harry_potter/screens/all_books.dart';
class MainNavScreens extends StatefulWidget {
  const MainNavScreens({super.key});

  @override
  State<MainNavScreens> createState() => _MainNavScreensState();
}

class _MainNavScreensState extends State<MainNavScreens> {
  int index = 0;
  List<Widget> screens = [AllBooks(), Text("settings"), Text("settings")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "books",
            activeIcon: Icon(Icons.menu_book_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            activeIcon: Icon(Icons.settings_cell_outlined),
          ),
        ],
      ));
  }
}
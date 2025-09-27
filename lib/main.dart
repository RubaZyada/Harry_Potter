import 'package:flutter/material.dart';
import 'package:harry_potter/routes.dart';
import 'package:harry_potter/screens/all_books.dart';
import 'package:harry_potter/screens/main_nav_screens.dart';
//import 'package:harry_potter/screens/book_details.dart';
//import 'package:harry_potter/widgets/book_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      routes: {
        Routes.mainNavScreens: (context) => const MainNavScreens(),
        Routes.allBooks: (context) => const AllBooks(),

    
      },
      home: const MainNavScreens(),
    );
  }
}


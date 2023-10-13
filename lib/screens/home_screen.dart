import 'package:bloc_pattern_cs_test/screens/product_screen.dart';
import 'package:bloc_pattern_cs_test/screens/users_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductsScreen()));
            },
            child: const Text('Get products'),
          )),

          const SizedBox(
            height: 20,
          ),
          //* other button

          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UsersScreen()));
            },
            child: const Text('Get Users'),
          )),
        ],
      ),
    );
  }
}

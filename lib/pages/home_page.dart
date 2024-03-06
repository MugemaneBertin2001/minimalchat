import 'package:flutter/material.dart';
import 'package:minimalchat/components/my_drawer.dart'; // Import the AuthService

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home"),
        ),

      ),
      drawer: const  MyDrawer(),
    );
  }
}

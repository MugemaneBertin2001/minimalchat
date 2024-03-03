import 'package:flutter/material.dart';
import 'package:minimalchat/auth/auth_service.dart'; // Import the AuthService

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Call the signOut method from the AuthService
              AuthService authService = AuthService();
              await authService.logout();
              
              // Navigate to the login page after signing out
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const  Drawer(),
    );
  }
}

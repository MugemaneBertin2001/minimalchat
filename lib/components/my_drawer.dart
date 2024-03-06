import 'package:flutter/material.dart';
import 'package:minimalchat/auth/auth_service.dart';
import 'package:minimalchat/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      // Call the logout function from the AuthService
      AuthService().logout(); // Assuming AuthService has a logout method
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  ),
                ),
              ),
              buildListTile("HOME", Icons.home,onTap: () => {

              },),
              buildListTile("SETTINGS", Icons.settings, onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                    )
                )
              },),
            ],
          ),
          buildListTile("LOGOUT", Icons.logout, onTap: logout),
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}

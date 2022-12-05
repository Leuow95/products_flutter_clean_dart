import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const ListTile(title: Text("Products")),
          const ListTile(
            title: Text("Login"),
          ),
          ListTile(
            title: const Text("Register"),
            onTap: () => Navigator.of(context).pushNamed("/register_user"),
          ),
        ],
      ),
    );
  }
}

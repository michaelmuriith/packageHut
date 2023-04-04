import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the UI and close the drawer
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the UI and close the drawer
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:preferencas_usuario/src/pages/home_page.dart';
import 'package:preferencas_usuario/src/pages/settings_page.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/original.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(
                Icons.pages,
                color: Colors.blue,
              ),
              title: Text('Pages'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName)),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: Text('Party mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}

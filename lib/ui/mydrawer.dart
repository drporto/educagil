import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 60.0,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            onTap: () => {
              Navigator.pushNamed(context, '/home'),
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
          ),
          Divider(
            height: 10,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () => {
              Navigator.pushNamed(context, '/login'),
            },
          ),
        ],
      ),
    );
  }
}

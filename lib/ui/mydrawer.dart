import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! var classroomModel = context.read<ClassroomModel>();
    return Drawer(
      child: Column(
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
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          Consumer<ClassroomModel>(
            builder: (context, classroomModel, child) {
              if (classroomModel.logado) {
                return ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Perfil',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                );
              } else
                return Container();
            },
          ),
          Divider(
            height: 10,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Consumer<ClassroomModel>(
            builder: (context, classroomModel, child) {
              if (classroomModel.logado) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: classroomModel.turmas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${classroomModel.turmas[index].name}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onTap: () {
                        Provider.of<ClassroomModel>(context, listen: false)
                            .getTurmaInfoFromDatabaseById(
                                classroomModel.turmas[index].id);
                        Navigator.pushNamed(context, '/classroom');
                      },
                    );
                  },
                );
              } else
                return Container();
            },
          ),
          Consumer<ClassroomModel>(
            builder: (context, classroomModel, child) {
              if (classroomModel.logado) {
                return Divider(
                  height: 10,
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                );
              } else
                return Container();
            },
          ),
          Consumer<ClassroomModel>(
            builder: (context, classroomModel, child) {
              if (!classroomModel.logado) {
                return ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Login'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                );
              } else
                return Container();
            },
          ),
          Consumer<ClassroomModel>(
            builder: (context, classroomModel, child) {
              if (classroomModel.logado) {
                return ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Provider.of<ClassroomModel>(context, listen: false)
                        .deleteAll();
                    Navigator.pushNamed(context, '/home');
                  },
                );
              } else
                return Container();
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}

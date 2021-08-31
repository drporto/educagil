import 'package:flutter/material.dart';

import 'package:educagil/ui/myappbar.dart';
import 'package:educagil/ui/mydrawer.dart';

// import 'package:provider/provider.dart';
// import 'package:educagil/models/classroommodel.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: MyAppBar(height: 60),
      /////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Perfil',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////
    );
  }
}

// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';

import 'package:educagil/ui/myappbar.dart';
import 'package:educagil/ui/mydrawer.dart';

// import 'package:provider/provider.dart';
// import 'package:educagil/models/classroommodel.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: MyAppBar(
        height: 60,
      ),
      /////////////////////////////////////////////////////////////////
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Sistema educacional desenvolvido por:',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'AgilizaBR',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
    /////////////////////////////////////////////////////////////////
  }
}

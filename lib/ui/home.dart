import 'package:educagil/appstate/classmodel.dart';
import 'package:flutter/material.dart';
import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double size = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Consumer<ClassModel>(
          builder: (context, classroom, child) => Text(
            'EducÁgil ${classroom.logged}',
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
        ),
        // Consumer<ClassModel>(
        //   builder: (context, cr, child) => {
        //     return Text(
        //       'EducÁgil',
        //       style: Theme.of(context).primaryTextTheme.headline5,
        //     ),
        //   },
        // ),
      ),
      /////////////////////////////////////////////////////////////////
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text('Treinamentos Futuros',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Container(
              height: size,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text('Treinamentos Concluídos',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Container(
              height: size,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////
    );
  }
}

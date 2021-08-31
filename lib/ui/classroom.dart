// ignore: avoid_web_libraries_in_flutter
import 'package:educagil/ui/myappbar.dart';
import 'package:flutter/material.dart';

import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';

class Classroom extends StatefulWidget {
  Classroom({Key? key}) : super(key: key);

  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  int _selectedItem = 0;
  List<String> _nameSelectedItem = ["Mural", "Materiais", "Participantes"];
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  //double size = 250.0;
  //double dividerHeight = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: MyAppBar(
        height: 60,
      ),
      /////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: Consumer<ClassroomModel>(
                builder: (context, classroomModel, child) => Text(
                  '${_nameSelectedItem[_selectedItem]} ${classroomModel.turmaSelecionada!.name}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Mural',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Materiais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Participantes',
          ),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      /////////////////////////////////////////////////////////////////
    );
  }
}

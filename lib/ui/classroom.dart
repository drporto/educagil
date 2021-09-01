// ignore: avoid_web_libraries_in_flutter
import 'package:educagil/ui/myappbar.dart';
import 'package:flutter/material.dart';

import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';
import 'package:educagil/ui/feed_item.dart';

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

  Widget makeMural(context, classroomModel, child) {
    //substituir pelo código do mural

    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 10.0),
        child: FeedColumn(feedName: "${classroomModel.turmaSelecionada!.name}",
            itemList: FeedItem.getFeedItems())
    );
  }

  Widget makeMateriais(context, classroomModel, child){
    //substituir pelo código da página de materiais
    return Text(
      'Materiais de ${classroomModel.turmaSelecionada!.name}',
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget makeParticipantes(context, classroomModel, child){
    //substituir pelo código da página de participantes
    return Text(
      'Participantes de ${classroomModel.turmaSelecionada!.name}',
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget escolherAba(tabIndex, context, classroomModel, child){
    if (tabIndex == 0){
      return this.makeMural(context, classroomModel, child);
    }else if (tabIndex == 1){
      return this.makeMateriais(context, classroomModel, child);
    }else{
      return this.makeParticipantes(context, classroomModel, child);
    }
  }

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
                builder: (context, classroomModel, child) => this.escolherAba(
                    _selectedItem, context, classroomModel, child
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

import 'package:flutter/material.dart';

class ClassmateColumn extends StatelessWidget {
  final List<Classmate> itemList;
  final String feedName;

  const ClassmateColumn({
    Key? key,
    required this.feedName,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenWithPadding = new List.empty(growable: true);
    childrenWithPadding.add(Text(
      this.feedName,
      style: Theme.of(context).textTheme.headline4,
    ));
    for(Classmate item in itemList){
      childrenWithPadding.add(SizedBox(height: 20));
      childrenWithPadding.add(item);
    }
    return Column(
        children: childrenWithPadding
    );
  }
}

class Classmate extends StatelessWidget {
  final String userName;
  final String email;
  final String telefone;

  const Classmate({
    Key? key,
    required this.userName,
    required this.email,
    required this.telefone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> elements = <Widget>[
      Text(
        this.userName,
        style: Theme.of(context).textTheme.headline6,
      ),
      Text(
          "Email: " + this.email,
          style: Theme.of(context).textTheme.bodyText1,
      ),
      Text(
        "Telefone: " + this.telefone,
        style: Theme.of(context).textTheme.bodyText1,
      )
    ];

    return Card(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,6.0,20.0,20.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: elements
            )
        )
    );
  }

  static List<Classmate> getClassmates(){
    return [
      Classmate(userName: "Márcia Marques",
          email: "marcia@gmail.com",
          telefone: "(84) 99999-0122",
      ),
      Classmate(userName: "Daniel Cabral",
        email: "danielcabral@gmail.com",
        telefone: "(84) 99356-1192",
      ),
      Classmate(userName: "Daniel Torres",
        email: "danieltorres@gmail.com",
        telefone: "(84) 99911-9366",
      ),
      Classmate(userName: "Diego Porto",
        email: "diego@gmail.com",
        telefone: "(84) 98887-3025",
      ),
      Classmate(userName: "Pitágoras Alves",
        email: "pitagoras@gmail.com",
        telefone: "(84) 98156-3749",
      )
    ];
  }
}


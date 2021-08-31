import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:educagil/ui/myappbar.dart';
import 'package:educagil/ui/mydrawer.dart';

// import 'package:provider/provider.dart';
// import 'package:educagil/models/classroommodel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double size = 250.0;
  double dividerHeight = 25.0;

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
              //margin: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Treinamentos Futuros',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ColecaoTurmas(
              height: this.size,
              children: [
                Turma(
                  text: 'Scrum com Lego',
                  image: 'assets/images/scrumlego.png',
                  width: this.size,
                ),
                Turma(
                  text: 'Kanban Pizza em Dobro',
                  image: 'assets/images/kanban.png',
                  width: this.size,
                ),
              ],
            ),
            Divider(
              height: this.dividerHeight,
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              //margin: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Treinamentos Em Andamento',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ColecaoTurmas(
              height: this.size,
              children: [
                Turma(
                  text: 'RH Ágil',
                  image: 'assets/images/rhagil.jpeg',
                  width: this.size,
                ),
              ],
            ),
            Divider(
              height: this.dividerHeight,
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              //margin: EdgeInsets.symmetric(vertical: 0),
              alignment: Alignment.centerLeft,
              child: Text('Treinamentos Concluídos',
                  style: Theme.of(context).textTheme.headline5),
            ),
            ColecaoTurmas(
              height: this.size,
              children: [
                Turma(
                  text: 'Dono do Produto',
                  image: 'assets/images/donoproduto.jpeg',
                  width: this.size,
                ),
                Turma(
                  text: 'Liderança Ágil',
                  image: 'assets/images/liderancaagil.jpeg',
                  width: this.size,
                ),
                Turma(
                  text: 'Scrum com Minecraft',
                  image: 'assets/images/minecraft.png',
                  width: this.size,
                ),
                Turma(
                  text: 'OKR',
                  image: 'assets/images/okr.jpeg',
                  width: this.size,
                ),
              ],
            ),
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////
    );
  }
}

class ColecaoTurmas extends StatelessWidget {
  final double height;
  final List<Turma> children;

  const ColecaoTurmas({
    Key? key,
    required this.height,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }
}

class Turma extends StatelessWidget {
  final String text;
  final String image;
  final double width;

  const Turma({
    Key? key,
    required this.text,
    required this.image,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              this.text,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: GestureDetector(
            onTap: () => {
              html.window.open('https://agilizabr.com/treinamentos/', "_blank")
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: this.width,
              child: Image(
                image: AssetImage(this.image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

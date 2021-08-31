import 'package:educagil/ui/myappbar.dart';
import 'package:flutter/material.dart';

import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double size = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: MyAppBar(
        height: 60,
      ),
      /////////////////////////////////////////////////////////////////
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                          child: Text(
                            'Usuário',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: usuarioController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite o seu usuário',
                                helperText: ' ',
                              ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                              validator: (value) {
                                if (value!.isEmpty) return 'Campo vazio';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                          child: Text(
                            'Senha',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: senhaController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite a sua senha',
                                helperText: ' ',
                              ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                              validator: (value) {
                                if (value!.isEmpty) return 'Campo vazio';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<ClassroomModel>(context, listen: false)
                              .setLogged(true);
                          Provider.of<ClassroomModel>(context, listen: false)
                              .getTurmasFromDatabase();
                          Provider.of<ClassroomModel>(
                            context,
                            listen: false,
                          ).getTurmaInfoFromDatabaseByIndex(0).then((result) {
                            if (result)
                              Navigator.pushNamed(context, '/classroom');
                            else
                              Navigator.pushNamed(context, '/home');
                          });
                          // var classroomModel = context.read<ClassroomModel>();
                          // classroomModel.setLogged(true);
                        }
                      },
                      child: const Text('Conectar'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////
    );
  }
}

import 'package:educagil/appstate/classmodel.dart';
import 'package:flutter/material.dart';
import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';

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
  static const String default_user = "Diego";
  static const String default_passwd = "1234";

  bool tryToLogin(String user, String passwd){
    return (user == default_user) && (passwd == default_passwd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      /////////////////////////////////////////////////////////////////
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        toolbarHeight: 60.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'EducÁgil',
          style: Theme.of(context).primaryTextTheme.headline5,
        ),
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
                        bool loginSuccess = tryToLogin(usuarioController.text,
                            senhaController.text);
                        if (loginSuccess){
                          var classroom = context.read<ClassModel>();
                          classroom.setLogged(true);
                          Navigator.pushNamed(context, '/home');
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Bem-vindo, '+default_user+'!'))
                          );
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Usuário e/ou senha incorretos.'))
                          );
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

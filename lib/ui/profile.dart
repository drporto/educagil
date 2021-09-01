import 'package:educagil/ui/myappbar.dart';
import 'package:flutter/material.dart';

import 'package:educagil/ui/mydrawer.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  double size = 250.0;
  static const String default_user = "Diego";
  static const String default_passwd = "1234";

  bool tryToProfile(String user, String passwd){
    return (user == default_user) && (passwd == default_passwd);
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
                            'Nome',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              initialValue: default_user,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite o seu Nome',
                                helperText: ' ',
                              ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,

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
                            'CPF',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite o seu CPF',
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
                            'Endereço',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite o seu endereço',
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
                            'E-mail',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Digite o seu E-mail',
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

                      },
                      child: const Text('Salvar'),
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

// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  MyAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(this.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(
        children: [
          Image(
            height: 45,
            image: AssetImage('assets/images/logo.png'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'EducÁgil',
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Color Type'),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('random'),
            value: true,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}

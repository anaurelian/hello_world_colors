import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hello_world_colors/common/ui_strings.dart';
import 'package:hello_world_colors/widgets/app_drawer.dart';
import 'package:hello_world_colors/widgets/filter_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ColorType> _colorTypeList = [ColorType.random];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      drawer: AppDrawer(),
      endDrawer: FilterDrawer(
        onColorTypeChanged: (List<ColorType> colorTypeList) {
          setState(() {
            _colorTypeList = colorTypeList;
          });
        },
      ),
      body: Text(_colorTypeList.toString()),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(UIStrings.appName),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

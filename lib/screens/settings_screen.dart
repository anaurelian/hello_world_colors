import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/ui_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
    required this.animateBlob,
  }) : super(key: key);

  final bool animateBlob;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _animateBlob = widget.animateBlob;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, {
          "animateBlob": _animateBlob,
        });
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(UIStrings.settingsScreen),
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text(UIStrings.animateBlobSetting),
              value: _animateBlob,
              onChanged: (bool value) => setState(() {
                _animateBlob = value;
              }),
            )
          ],
        ),
      ),
    );
  }
}

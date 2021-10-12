import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_settings.dart';
import 'package:hello_world_colors/common/ui_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UIStrings.settingsScreen),
      ),
      body: ListView(
        children: [
          Slider(
            min: 0,
            max: 5000,
            value: AppSettings().blobSpeed,
            onChanged: (double value) => setState(() {
              AppSettings().blobSpeed = value;
            }),
          ),
          // SwitchListTile(
          //   title: const Text(UIStrings.animateBlobSetting),
          //   value: _animateBlob,
          //   onChanged: (bool value) => setState(() {
          //     _animateBlob = value;
          //   }),
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hello_world_colors/common/ui_strings.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    Key? key,
    required this.onColorTypeChanged,
  }) : super(key: key);

  /// Called when the user taps a drawer item.
  final void Function(List<ColorType> colorTypeList) onColorTypeChanged;

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final Map<ColorType, bool> _colorTypeMap = {
    ColorType.random: true,
    ColorType.red: false,
    ColorType.orange: false,
    ColorType.yellow: false,
    ColorType.green: false,
    ColorType.blue: false,
    ColorType.purple: false,
    ColorType.pink: false,
    ColorType.monochrome: false,
  };

  Luminosity _luminosity = Luminosity.random;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text(UIStrings.colorTypeFilter), enabled: false),
          for (ColorType colorType in _colorTypeMap.keys) _buildColorType(colorType),
          const ListTile(title: Text(UIStrings.luminosityFilter), enabled: false),
          _buildLuminosityOption(Luminosity.random),
          _buildLuminosityOption(Luminosity.bright),
          _buildLuminosityOption(Luminosity.light),
          _buildLuminosityOption(Luminosity.dark),
          // for (Luminosity luminosity in Luminosity.values) _buildLuminosityOption(luminosity),
        ],
      ),
    );
  }

  Widget _buildColorType(ColorType colorType) {
    return CheckboxListTile(
      title: Text(describeEnum(colorType)),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      value: _colorTypeMap[colorType],
      onChanged: (bool? value) {
        setState(() {
          if (value != null) _colorTypeMap[colorType] = value;
        });
        widget.onColorTypeChanged(_colorTypeMap.entries.where((e) => e.value).map((e) => e.key).toList());
      },
    );
  }

  Widget _buildLuminosityOption(Luminosity luminosity) {
    return RadioListTile<Luminosity>(
      title: Text(describeEnum(luminosity)),
      dense: true,
      value: luminosity,
      groupValue: _luminosity,
      onChanged: (Luminosity? value) => setState(() {
        if (value != null) _luminosity = value;
      }),
    );
  }
}

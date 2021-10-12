import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hello_world_colors/common/ui_strings.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    Key? key,
    required this.colorTypes,
    required this.luminosity,
    required this.onFilterChanged,
  }) : super(key: key);

  final Set<ColorType> colorTypes;

  final Luminosity luminosity;

  /// Called when the user taps a drawer item.
  final void Function(Set<ColorType> colorTypes, Luminosity luminosity) onFilterChanged;

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late final Set<ColorType> _colorTypes = widget.colorTypes;

  late Luminosity _luminosity = widget.luminosity;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text(UIStrings.colorTypeFilter), enabled: false),
          _buildColorType(ColorType.random),
          _buildColorType(ColorType.red),
          _buildColorType(ColorType.orange),
          _buildColorType(ColorType.yellow),
          _buildColorType(ColorType.green),
          _buildColorType(ColorType.blue),
          _buildColorType(ColorType.purple),
          _buildColorType(ColorType.pink),
          _buildColorType(ColorType.monochrome),
          const ListTile(title: Text(UIStrings.luminosityFilter), enabled: false),
          _buildLuminosityOption(Luminosity.random),
          _buildLuminosityOption(Luminosity.bright),
          _buildLuminosityOption(Luminosity.light),
          _buildLuminosityOption(Luminosity.dark),
        ],
      ),
    );
  }

  Widget _buildColorType(ColorType colorType) {
    return CheckboxListTile(
      title: Text(describeEnum(colorType)),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      value: _colorTypes.contains(colorType),
      onChanged: (bool? value) {
        setState(() {
          if (value != null) {
            if (value) {
              _colorTypes.add(colorType);
            } else {
              _colorTypes.remove(colorType);
            }
            widget.onFilterChanged(_colorTypes, _luminosity);
          }
        });
        // widget.onColorTypeChanged(_colorTypeMap.entries.where((e) => e.value).map((e) => e.key).toList());
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
        if (value != null) {
          _luminosity = value;
          widget.onFilterChanged(_colorTypes, _luminosity);
        }
      }),
    );
  }
}

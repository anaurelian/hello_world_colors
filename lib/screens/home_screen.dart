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
  List<Color> _colors = [];

  Set<ColorType> _colorTypeSet = {ColorType.random};

  Luminosity _luminosity = Luminosity.random;

  void _shuffleColors() {
    Options options = Options(
      count: 10,
      format: Format.rgbArray,
      colorType: _colorTypeSet.toList(),
      luminosity: _luminosity,
    );
    print(options.colorType);
    final List rgbColors = RandomColor.getColor(options);

    setState(() {
      _colors = rgbColors.map((rgb) => Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1.0)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _AppBar(),
      drawer: AppDrawer(),
      endDrawer: FilterDrawer(
        colorTypes: _colorTypeSet,
        luminosity: _luminosity,
        onFilterChanged: (Set<ColorType> colorTypes, Luminosity luminosity) {
          setState(() {
            _colorTypeSet = colorTypes;
            _luminosity = luminosity;
          });
        },
      ),
      body: _buildBody(_mediaSize),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleColors,
        child: const Icon(Icons.shuffle_rounded),
      ),
    );
  }

  Widget _buildBody(Size mediaSize) {
    return ListView.builder(
      itemCount: _colors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Container(
          //   padding: const EdgeInsets.all(12.0),
          //   color: _colors[index],
          //   height: mediaSize.height / 2,
          //   child: Text(_colors[index].toString()),
          // ),
          child: PhysicalModel(
            color: _colors[index],
            elevation: 8.0,
            shadowColor: _colors[index],
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 100,
              height: mediaSize.height * 0.75,
            ),
          ),
        );
      },
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

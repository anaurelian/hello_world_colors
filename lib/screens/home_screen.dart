import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hello_world_colors/utils/color_utils.dart';
import 'package:hello_world_colors/widgets/filter_drawer.dart';
import 'package:blobs/blobs.dart';
import 'package:hello_world_colors/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.red;

  Set<ColorType> _colorTypeSet = {ColorType.random};

  Luminosity _luminosity = Luminosity.random;

  final BlobController _blobController = BlobController();

  void _shuffleColors() {
    Options options = Options(
      count: 1,
      format: Format.rgbArray,
      colorType: _colorTypeSet.toList(),
      luminosity: _luminosity,
    );
    List<int> rgb = RandomColor.getColor(options);
    // print(options.colorType);

    setState(() {
      _color = Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1.0);
    });
    _blobController.change();
  }

  void _onAppBarAction(HomeAppBarOverflowActions action) {

  }

  @override
  Widget build(BuildContext context) {
    Size _mediaSize = MediaQuery.of(context).size;
    final Color contrastColor = ColorUtils.contrastColor(_color);

    return Scaffold(
      appBar: HomeAppBar(
        color: _color,
        onAction: _onAppBarAction,
      ),
      // drawer: AppDrawer(),
      endDrawer: FilterDrawer(
        colorTypes: _colorTypeSet,
        luminosity: _luminosity,
        onFilterChanged: (Set<ColorType> colorTypes, Luminosity luminosity) {
          _colorTypeSet = colorTypes;
          _luminosity = luminosity;
          _shuffleColors();

          // setState(() {
          //   _colorTypeSet = colorTypes;
          //   _luminosity = luminosity;
          // });
        },
      ),
      body: _buildBody(_mediaSize),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleColors,
        backgroundColor: _color,
        foregroundColor: contrastColor,
        child: const Icon(Icons.shuffle_rounded),
      ),
    );
  }

  Widget _buildBody(Size mediaSize) {
    return Center(
      child: Blob.random(
        size: mediaSize.shortestSide,
        edgesCount: 5,
        minGrowth: 4,
        // loop: true,
        // duration: const Duration(milliseconds: 1500),
        styles: BlobStyles(
          color: _color,
        ),
        controller: _blobController,
      ),
    );
  }
}


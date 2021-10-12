import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/ui_strings.dart';
import 'package:hello_world_colors/utils/color_utils.dart';

enum HomeAppBarOverflowActions { copy, settings, rate, what }

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.color,
    required this.onAction,
  }) : super(key: key);

  final Color color;

  final Function(HomeAppBarOverflowActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      foregroundColor: ColorUtils.contrastColor(color),
      title: const Text(UIStrings.appName),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
        PopupMenuButton<HomeAppBarOverflowActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<HomeAppBarOverflowActions>>[
            PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.copy,
              child: Text(UIStrings.copyAction(color)),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.settings,
              child: Text(UIStrings.settingsAction),
            ),
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.rate,
              child: Text(UIStrings.rateAction),
            ),
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.what,
              child: Text(UIStrings.whatAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

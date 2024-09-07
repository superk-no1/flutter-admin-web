import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

import '../../router/router_manager.dart';

class RootScaffold extends StatefulWidget {
  final Widget child;

  const RootScaffold({super.key, required this.child});

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
          items: RouterManager.adaptMenuItems,
          selected: currentIndex,
          onChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
            RouterManager.goByIndex(index);
          }),
      paneBodyBuilder: (item, _) {
        return Column(
          children: [_buildContentTopBar(), Expanded(child: widget.child)],
        );
      },
    );
  }

  Widget _buildContentTopBar() {
    return Container(
      height: 40,
      color: material.Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_buildBreadcrumb()],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        RouterManager.currentBreadcrumbStr,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

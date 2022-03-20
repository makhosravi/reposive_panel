import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/app_bar/app_bar_widget.dart';
import 'package:flutter_responsive_panel/drawer/drawer_page.dart';
import 'package:flutter_responsive_panel/panel_center/panel_center_page.dart';
import 'package:flutter_responsive_panel/panel_left/panel_left_page.dart';
import 'package:flutter_responsive_panel/panel_right/panel_right_page.dart';
import 'package:flutter_responsive_panel/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: (ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLimit(context)
              ? Container()
              : const AppBarWidget()),
          preferredSize: const Size(double.infinity, 100.0)),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PanelCenterPage(),
        tablet: Row(
          children: const <Widget>[
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTablet: Row(
          children: const <Widget>[
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: const <Widget>[
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }
}

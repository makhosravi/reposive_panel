import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/app_bar/app_bar_widget.dart';
import 'package:flutter_responsive_panel/constants.dart';
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
  int _currentIndex = 1;
  final List<Widget> _icons = const [
    Icon(
      Icons.add,
      size: 30.0,
    ),
    Icon(
      Icons.list,
      size: 30.0,
    ),
    Icon(
      Icons.compare_arrows,
      size: 30.0,
    ),
  ];

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
        phone: _currentIndex == 0
            ? const PanelLeftPage()
            : _currentIndex == 1
                ? const PanelCenterPage()
                : const PanelRightPage(),
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
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: _currentIndex,
              items: _icons,
              backgroundColor: Constants.purpleDark,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}

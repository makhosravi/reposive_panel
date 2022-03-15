import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/drawer/drawer_page.dart';
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
              : AppBar()),
          preferredSize: const Size(double.infinity, 100.0)),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: Container(),
        tablet: Container(),
        largeTablet: Container(),
        computer: Container(),
      ),
      drawer: DrawerPage(),
    );
  }
}

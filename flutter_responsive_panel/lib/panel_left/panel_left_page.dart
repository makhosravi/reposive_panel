import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/constants.dart';
import 'package:flutter_responsive_panel/panel_left/circle_chart.dart';
import 'package:flutter_responsive_panel/panel_left/curved_chart.dart';
import 'package:flutter_responsive_panel/responsive_layout.dart';

class Todo {
  Todo({required this.name, this.enable = true});

  String name;
  bool enable;
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _toDo = [
    Todo(name: 'Purchase Paper', enable: true),
    Todo(name: 'Refill the inventory of speakers', enable: true),
    Todo(name: 'Hire someone', enable: true),
    Todo(name: 'Marketing Strategy', enable: true),
    Todo(name: 'Selling furniture', enable: true),
    Todo(name: 'Finish the disclosure', enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50.0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          'Products Sold',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '18% of Products Sold',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            '4.500',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const LineChartSample2(),
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: List.generate(
                        _toDo.length,
                        (index) => CheckboxListTile(
                          title: Text(
                            _toDo[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _toDo[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _toDo[index].enable = newValue ?? true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/constants.dart';
import 'package:flutter_responsive_panel/panel_center/linear_chart.dart';

class Person {
  Person({required this.name, required this.color});
  final String name;
  final Color color;
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  final List<Person> _persons = [
    Person(name: 'Theia Bowen', color: Constants.orangeLight),
    Person(name: 'Fariha Odling', color: Constants.redLight),
    Person(name: 'Viola Willis', color: Constants.blueLight),
    Person(name: 'Emmet Forrest', color: Constants.orangeLight),
    Person(name: 'Nick Jarvis', color: Constants.greenLight),
    Person(name: 'Amit Claveia', color: Constants.orangeLight),
    Person(name: 'Amalie Howardeia', color: Constants.redLight),
    Person(name: 'Campbell Britton', color: Constants.blueLight),
    Person(name: 'Harley Mellor', color: Constants.redLight),
    Person(name: 'Harlen Higgins', color: Constants.greenLight),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                elevation: 3.0,
                color: Constants.purpleLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: ListTile(
                    title: Text(
                      'Products Available',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '82& of Products Avail.',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        '20.500',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
                bottom: Constants.kPadding,
              ),
              child: Card(
                elevation: 3.0,
                color: Constants.purpleLight,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                child: Column(
                  children: List.generate(_persons.length, (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15.0,
                      child: Text(_persons[index].name.substring(0, 1), style: const TextStyle(color: Colors.white),),
                      backgroundColor: _persons[index].color,
                    ),
                    title: Text(_persons[index].name, style: const TextStyle(color: Colors.white),),
                    trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.message, color: Colors.white,),),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

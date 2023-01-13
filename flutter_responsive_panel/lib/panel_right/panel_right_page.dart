import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/constants.dart';
import 'package:flutter_responsive_panel/panel_right/wiggle_gragh.dart';

class Product {
  Product({required this.name, this.enable = true});

  final String name;
  bool enable;
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  final List<Product> _products = [
    Product(name: 'LED Submersible light', enable: true),
    Product(name: 'Portable Projector', enable: true),
    Product(name: 'Bluetooth Speaker', enable: true),
    Product(name: 'Smart Watch', enable: true),
    Product(name: 'Temporary Tattoos', enable: true),
    Product(name: 'Bookends', enable: true),
    Product(name: 'Vegtable Chopper', enable: true),
    Product(name: 'Neck Messager', enable: true),
    Product(name: 'Facial Cleanser', enable: true),
    Product(name: 'Back Cushion', enable: true),
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
                      'Net Revenue',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '7% of Saves Avg.',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r'$46,450',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const LineChartSample1(),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: List.generate(
                    _products.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        _products[index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      value: _products[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          _products[index].enable = newValue;
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
    );
  }
}

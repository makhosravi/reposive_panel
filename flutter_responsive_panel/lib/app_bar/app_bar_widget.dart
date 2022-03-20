import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/constants.dart';
import 'package:flutter_responsive_panel/responsive_layout.dart';

List<String> _buttonNames = ['Overview', 'Revenue', 'Sales', 'Control'];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: <Widget>[
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30.0,
                child: Image.asset('assets/images/mapp.png'),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30.0,
              icon: const Icon(Icons.menu),
              color: Colors.white,
            ),
          const SizedBox(
            width: Constants.kPadding,
          ),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                          color: _currentSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Constants.kPadding / 2),
                        width: 60.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          gradient: _currentSelectedButton == index
                              ? const LinearGradient(
                                  colors: [
                                    Constants.redDark,
                                    Constants.orangeDark,
                                  ],
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 60.0,
                    height: 2.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Constants.redDark,
                          Constants.orangeDark,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            color: Colors.white,
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                iconSize: 30,
                color: Colors.white,
              ),
              const Positioned(
                right: 6.0,
                top: 6.0,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8.0,
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30.0,
                child: Image.asset('assets/images/profile.png'),
              ),
            )
        ],
      ),
    );
  }
}

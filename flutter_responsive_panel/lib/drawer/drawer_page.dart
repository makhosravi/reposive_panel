import 'package:flutter/material.dart';
import 'package:flutter_responsive_panel/constants.dart';
import 'package:flutter_responsive_panel/responsive_layout.dart';

class ButtonsInfo {
  const ButtonsInfo({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  const ButtonsInfo(title: 'Home', icon: Icons.home),
  const ButtonsInfo(title: 'Setting', icon: Icons.settings),
  const ButtonsInfo(title: 'Notifications', icon: Icons.notifications),
  const ButtonsInfo(title: 'Contacts', icon: Icons.contact_phone_rounded),
  const ButtonsInfo(title: 'Sales', icon: Icons.sell),
  const ButtonsInfo(title: 'Marketing', icon: Icons.mark_email_read),
  const ButtonsInfo(title: 'Security', icon: Icons.verified_user),
  const ButtonsInfo(title: 'User', icon: Icons.supervised_user_circle_rounded),
];

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Admin Menu',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
              ),
              // This will create a list of widgets
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: <Widget>[
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.orangeDark.withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

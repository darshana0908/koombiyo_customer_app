import 'dart:developer';

import 'package:customer_app/Ui/home/delivery_form/drag_location.dart';
import 'package:customer_app/Ui/home/home3.dart';
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home/cart/cart.dart';
import '../home/notification/notification.dart';
import '../home/profile/account/account.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List imglist = [
  'assets/j1.jpg',
  'assets/j2.jpg',
  'assets/j3.jpg',
  'assets/j4.jpg',
  'assets/j.jpg',
];

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Home3(),
    NotificationScreen(),
    // Cart(),
    DragLocation(),
    Account(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  back() {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("This is my message."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevent back
      onPopInvoked: (pop) async {},
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              useLegacyColorScheme: true,
              selectedItemColor: appButtonColorLite,
              enableFeedback: true,
              currentIndex: _selectedIndex,
              unselectedLabelStyle: TextStyle(color: black3),
              unselectedItemColor: black3,
              onTap: (index) {
                _onItemTapped(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.send_time_extension_rounded),
                    label: 'Send',
                    backgroundColor: white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Account',
                ),
              ],
            ),
            body: Center(child: _pages.elementAt(_selectedIndex))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ticketify/presentation/screens/explore_screen/explore_screen.dart';
import 'package:ticketify/presentation/screens/main_screen/buildMainScreenAppBar.dart';
import '../home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  static const List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    Center(child: Text("Notification page is in process."),),
    Center(child: Text("Message page is in process."),),
  ];
  int index = 1;
  void _onTap(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildMainScreenAppBar(index: index),
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.messenger_outline),label: "Messages"),
        ],
        elevation: 8,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: index,
        onTap: _onTap,
      ),
    );
  }


}

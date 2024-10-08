import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketify/presentation/screens/explore_screen/explore_screen.dart';
import 'package:ticketify/presentation/screens/main_screen/functions/load_user_image.dart';
import 'package:ticketify/presentation/screens/main_screen/widgets/build_main_screen_app_bar.dart';
import '../../../storage/storage_client.dart';
import '../home_screen/home_screen.dart';
import '../splash_screen/splash_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Notification page is in process."),
        InkWell(
          onTap: () async {
            FirebaseAuth.instance.signOut();
            await Storage().deleteData();
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SplashHomePage(),));
          },
            child: Icon(Icons.exit_to_app, color: Colors.black,))
      ],
    ),),
    Center(child: Text("Message page is in process."),),
  ];

  int index = 1;
  void _onTap(int i) {
    setState(() {
      index = i;
    });
  }

  String? _imageUrl;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    _imageUrl = await loadUserPhoto();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: buildMainScreenAppBar(index: index, imageURL: _imageUrl),
          body: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: pages.elementAt(index)
          ),
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

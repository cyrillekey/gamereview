import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gamereview/controllers/auth_provider.dart';

import 'package:gamereview/screens/toggle_screens.dart';
import 'package:gamereview/widgets/alerts.dart';
import 'package:provider/provider.dart';

import 'package:slide_drawer/slide_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  late User user;
  @override
  void initState() {
    super.initState();
    user = Provider.of<Authprovider>(context, listen: false).user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlideDrawer(
      headDrawer: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  user.displayName?.substring(0, 1) ?? "U",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.green,
              ),
              title: Text(user.displayName ?? "Username"),
              subtitle: Text(user.email ?? "example@mail.com"),
              trailing: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(80, 40)),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Alerts.showOptionDialog(
                        context, "Logout", "Are you sure you wish to logout?",
                        () {
                      Provider.of<Authprovider>(context, listen: false)
                          .logoutuser(context);
                    });
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
      backgroundGradient: LinearGradient(colors: [
        Colors.blueGrey.shade900,
        Colors.blueGrey.shade800,
        Colors.blueGrey.shade600
      ]),
      alignment: SlideDrawerAlignment.start,
      offsetFromRight: 120,
      contentDrawer: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            menuButton(0, Icons.home_rounded, "Home"),
            menuButton(1, Icons.gamepad_outlined, "Platforms"),
            menuButton(2, Icons.favorite_outline, "Favourites"),
            menuButton(3, Icons.newspaper, "News Feed"),
            menuButton(4, Icons.account_circle_rounded, "Profile")
          ],
        ),
      ),
      child: ToggleScrren(
        index: index,
      ),
    ));
  }

  ListTile menuButton(int index, IconData icon, String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        setState(() {
          this.index = index;
        });
      },
      leading: Icon(
        icon,
        size: 35,
      ),
    );
  }
}

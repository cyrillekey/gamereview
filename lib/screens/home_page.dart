import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/screens/toggle_screens.dart';
import 'package:gamereview/widgets/alerts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:slide_drawer/slide_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
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
                backgroundColor: Colors.green,
              ),
              title: Text("Test User"),
              subtitle: Text("Example@mail.com"),
              trailing: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(100, 40)),
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
            ListTile(
              title: Text("Home"),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Platforms"),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              leading: Icon(Icons.videogame_asset),
            )
          ],
        ),
      ),
      child: ToggleScrren(
        index: index,
      ),
    ));
  }
}

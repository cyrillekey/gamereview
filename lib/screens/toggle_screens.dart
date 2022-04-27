import 'package:flutter/material.dart';
import 'package:gamereview/models/genre.dart';
import 'package:gamereview/models/platform.dart';
import 'package:gamereview/screens/favourites.dart';
import 'package:gamereview/screens/home.dart';
import 'package:gamereview/screens/my_feed.dart';
import 'package:gamereview/screens/platforms_screen.dart';
import 'package:slide_drawer/slide_drawer.dart';

class ToggleScrren extends StatefulWidget {
  final int index;
  ToggleScrren({Key? key, required this.index}) : super(key: key);

  @override
  State<ToggleScrren> createState() => _ToggleScrrenState();
}

class _ToggleScrrenState extends State<ToggleScrren> {
  List<Widget> _screens = [];
  @override
  void initState() {
    super.initState();
    _screens = [Home(), Platforms(), Favouries(), MyFeeds()];
  }

  @override
  Widget build(BuildContext context) {
    SlideDrawer.of(context)?.close();
    return Scaffold(body: _screens[widget.index]);
  }
}

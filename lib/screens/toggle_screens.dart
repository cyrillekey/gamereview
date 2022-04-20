import 'package:flutter/material.dart';
import 'package:gamereview/screens/home.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/sing_in.dart';
import 'package:gamereview/services/service_locator.dart';
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
    _screens = [Home()];
  }

  @override
  Widget build(BuildContext context) {
    SlideDrawer.of(context)?.close();
    return Scaffold(
      body: Container(height: double.infinity, child: _screens[widget.index]),
    );
  }
}

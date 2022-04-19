import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/screens/toggle_screens.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:slide_drawer/slide_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlideDrawer(
      alignment: SlideDrawerAlignment.start,
      offsetFromRight: 40,
      contentDrawer: Container(),
      child: Expanded(
        child: ToggleScrren(
          index: 0,
        ),
      ),
    ));
  }
}

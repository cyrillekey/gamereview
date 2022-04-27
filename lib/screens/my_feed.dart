import 'package:flutter/material.dart';
import 'package:gamereview/screens/news_channels.dart';
import 'package:slide_drawer/slide_drawer.dart';

class MyFeeds extends StatefulWidget {
  const MyFeeds({Key? key}) : super(key: key);

  @override
  State<MyFeeds> createState() => _MyFeedsState();
}

class _MyFeedsState extends State<MyFeeds> {
  List<dynamic> choices = [
    {"text": "News feed", "value": "feed"},
    {"text": "Channels", "value": "channel"},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    SlideDrawer.of(context)?.open();
                  },
                  icon: Icon(Icons.menu)),
              PopupMenuButton(
                  onSelected: (value) {
                    switch (value) {
                      case "channel":
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewsChannels()));
                        break;
                      default:
                    }
                  },
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: ((context) {
                    return choices
                        .map((e) => PopupMenuItem(
                            value: e['value'],
                            child: menuItemButton(e['text'])))
                        .toList();
                  }))
            ],
          ),
        )
      ],
    );
  }

  Widget menuItemButton(String title) {
    return InkWell(
      child: Text(title),
    );
  }
}
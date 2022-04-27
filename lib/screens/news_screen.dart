import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

class NewsArticles extends StatefulWidget {
  const NewsArticles({Key? key}) : super(key: key);

  @override
  State<NewsArticles> createState() => _NewsArticlesState();
}

class _NewsArticlesState extends State<NewsArticles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        SlideDrawer.of(context)?.open();
                      },
                      icon: Icon(Icons.menu)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

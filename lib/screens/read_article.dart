import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/models/news_article_model.dart';
import 'package:intl/intl.dart';

class ReadArticle extends StatelessWidget {
  ReadArticle(this.news);
  final NewsArticleModel news;

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.parse(news.publishedAt);
    var formated = DateFormat.yMMMMd().format(dt);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              child: Container(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Positioned(
                        bottom: 40,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(news.author,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "$formated",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(news.urlToUmage)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          news.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: RichText(
                            text: TextSpan(
                                text: news.content,
                                style: TextStyle(color: Colors.black))),
                      )
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

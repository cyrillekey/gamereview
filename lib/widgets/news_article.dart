import 'package:cached_network_image/cached_network_image.dart';
import 'package:gamereview/models/news_article_model.dart';
import 'package:gamereview/screens/read_article.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';

Widget newsAricle(NewsArticleModel news, BuildContext context, String tag,
    String title, String imageUrl, String preview) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReadArticle(news)));
    },
    child: Card(
      child: Container(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 105,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GlassmorphicContainer(
                        alignment: Alignment.centerLeft,
                        width: 100,
                        height: 30,
                        border: 1,
                        borderRadius: 8.0,
                        borderGradient: LinearGradient(
                            colors: [Colors.white, Colors.white12]),
                        blur: 2.0,
                        linearGradient: LinearGradient(colors: [
                          Color.fromARGB(255, 243, 183, 23),
                          Color.fromARGB(255, 231, 182, 53),
                          Color.fromARGB(255, 242, 154, 33),
                          Color.fromARGB(255, 248, 118, 37),
                          Color.fromARGB(255, 253, 81, 45)
                        ]),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              tag,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 105,
                width: 100,
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

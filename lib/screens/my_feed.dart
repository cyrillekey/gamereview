import 'package:flutter/material.dart';
import 'package:gamereview/controllers/news_provider.dart';
import 'package:gamereview/models/news_article_model.dart';
import 'package:gamereview/screens/news_channels.dart';
import 'package:gamereview/widgets/news_article.dart';
import 'package:paginable/paginable.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, newsProvider, child) {
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
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.89,
            child: newsProvider.isLoading == true
                ? Shimmer.fromColors(
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) => Card(
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            )),
                    enabled: true,
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!)
                : PaginableListView.builder(
                    errorIndicatorWidget: (err, r) => Center(
                          child: Text("Something went wrong"),
                        ),
                    progressIndicatorWidget: Center(
                      child: CircularProgressIndicator(),
                    ),
                    loadMore: newsProvider.loadMore,
                    itemCount: newsProvider.newsArticles.length,
                    itemBuilder: (context, index) {
                      NewsArticleModel news = newsProvider.newsArticles[index];
                      return newsAricle(news, context, "tag", news.title,
                          news.urlToUmage, "preview");
                    }),
          )
        ],
      );
    });
  }

  Widget menuItemButton(String title) {
    return InkWell(
      child: Text(title),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gamereview/controllers/news_provider.dart';
import 'package:gamereview/widgets/news_article.dart';
import 'package:provider/provider.dart';

class SavedArticles extends StatefulWidget {
  const SavedArticles({Key? key}) : super(key: key);

  @override
  State<SavedArticles> createState() => _SavedArticlesState();
}

class _SavedArticlesState extends State<SavedArticles> {
  @override
  void initState() {
    Provider.of<NewsProvider>(context, listen: false).getSavedArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsProvider>(builder: (context, newsProvider, child) {
        return ListView.builder(
            itemBuilder: (context, index) => newsAricle(
                newsProvider.savedNews[index],
                context,
                "${newsProvider.savedNews[index].source?.name}",
                newsProvider.savedNews[index].title,
                newsProvider.savedNews[index].urlToUmage,
                newsProvider.savedNews[index].description));
      }),
    );
  }
}

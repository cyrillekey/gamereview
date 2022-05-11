import 'package:flutter/widgets.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/database/local_db_dao.dart';
import 'package:gamereview/models/news_article_model.dart';
import 'package:gamereview/services/service_locator.dart';

class NewsProvider with ChangeNotifier {
  final _apiClient = locator<ApiClient>();
  LocalDatabaseDao db = locator<LocalDatabaseDao>();
  List<NewsArticleModel> newsArticles = [];
  List<Source> sources = [];
  List<Source> savedSources = [];
  bool isLoading = false;
  bool isSourceFinished = false;
  int page = 1;
  initPage() {
    getSources();
    getSavedSources();
    isSourceFinished = true;
    logger.i(savedSources);
    notifyListeners();
  }

  Future<List<NewsArticleModel>> getNewsArticles() async {
    isLoading = true;
    notifyListeners();
    ApiRespose respose = await _apiClient.get(
        "https://newsapi.org/v2/everything?q=gaming&apiKey=74f1ebd4692f4f3d8adb0e4674dd1ae7");
    newsArticles = respose.response['articles']
        .map<NewsArticleModel>((e) => NewsArticleModel.fromJson(e))
        .toList();
    isLoading = false;
    page++;
    notifyListeners();
    return newsArticles;
  }

  Future<List<NewsArticleModel>> loadMore() async {
    ApiRespose respose = await _apiClient.get(
        "https://newsapi.org/v2/everything?q=gaming&apiKey=74f1ebd4692f4f3d8adb0e4674dd1ae7&page=$page");
    newsArticles += respose.response['articles']
        .map<NewsArticleModel>((e) => NewsArticleModel.fromJson(e))
        .toList();
    isLoading = false;
    page++;
    notifyListeners();
    return newsArticles;
  }

  Future<List<Source>> getSources() async {
    ApiRespose response = await _apiClient.get(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=74f1ebd4692f4f3d8adb0e4674dd1ae7");
    sources = response.response['sources']
        .map<Source>((e) => Source.fromJson(e))
        .toList();
    notifyListeners();
    return sources;
  }

  getSavedSources() async {
    savedSources = await db.getUserSources();
  }

  Future<void> addNewSource(Source source) async {
    await db.saveNewsource(source);
    notifyListeners();
  }

  unsetSavedSource(Source source) async {
    await db.unsetSource(source.id);
    notifyListeners();
  }

  isSource(Source e) {
    var present = savedSources.where((element) => element.id == e.id);
    return present != null;
  }
}

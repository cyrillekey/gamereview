import 'package:flutter/material.dart';
import 'package:gamereview/controllers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsChannels extends StatefulWidget {
  const NewsChannels({Key? key}) : super(key: key);

  @override
  State<NewsChannels> createState() => _NewsChannelsState();
}

class _NewsChannelsState extends State<NewsChannels> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).initPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
            ),
            Consumer<NewsProvider>(builder: (context, provider, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: provider.isSourceFinished == true
                    ? GridView.count(
                        crossAxisCount: 4,
                        children: provider.sources
                            .map((e) => InkWell(
                                  onTap: () {
                                    provider.addNewSource(e);
                                  },
                                  child: Card(
                                    elevation: provider.isSource(e) == true
                                        ? 10.0
                                        : 1.0,
                                    child: Column(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: provider.isSource(e) == true
                                                ? Icon(Icons.check_circle)
                                                : SizedBox()),
                                        Text(
                                          e.name,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList())
                    : GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(
                            40,
                            (index) => Shimmer.fromColors(
                                child: Card(
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                ),
                                baseColor: Colors.grey[400]!,
                                highlightColor: Colors.grey[100]!)),
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}

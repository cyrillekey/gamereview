import 'package:flutter/material.dart';
import 'package:gamereview/controllers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsChannels extends StatefulWidget {
  const NewsChannels({Key? key}) : super(key: key);

  @override
  State<NewsChannels> createState() => _NewsChannelsState();
}

class _NewsChannelsState extends State<NewsChannels> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getSources();
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
                child: GridView.count(
                    crossAxisCount: 4,
                    children: provider.sources
                        .map((e) => Card(
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.check_circle)),
                                  Text(
                                    e.name,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ))
                        .toList()),
              );
            })
          ],
        ),
      ),
    );
  }
}

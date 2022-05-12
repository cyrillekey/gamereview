import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/screens/single_game.dart';
import 'package:gamereview/utils/images.dart';
import 'package:paginable/paginable.dart';
import 'package:provider/provider.dart';

class ViewAll extends StatefulWidget {
  ViewAll();

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
          Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.more_horiz),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: PaginableListView.builder(
                  loadMore: homeProvider.loadMorePopular,
                  progressIndicatorWidget: Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorIndicatorWidget: (ex, t) => Center(
                        child: Text("Error"),
                      ),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleGame(
                                        game: homeProvider.popular[index],
                                      )));
                        },
                        child: Card(
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      height: 130,
                                      width: 90,
                                      imageUrl: homeProvider
                                          .popular[index].background_image,
                                      errorWidget: (context, string, d) =>
                                          Image(
                                              image: AssetImage(Images.gaming)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 130,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          homeProvider.popular[index].name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Wrap(
                                          children: homeProvider
                                              .popular[index].genres
                                              .map((e) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Text(e.name),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: RatingBarIndicator(
                                            itemCount: 5,
                                            itemSize: 20,
                                            rating: homeProvider
                                                .popular[index].rating,
                                            itemBuilder: ((context, index) {
                                              return Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              );
                                            })),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(FontAwesome5.newspaper)
                              ],
                            ),
                          ),
                        ),
                      ),
                  itemCount: homeProvider.popular.length),
            )
          ],
        );
      })),
    );
  }
}

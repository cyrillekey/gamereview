import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/screens/search.dart';
import 'package:gamereview/screens/single_game.dart';
import 'package:gamereview/screens/view_all.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_drawer/slide_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool show = true;
  int index = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: show
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Add game"),
              icon: Icon(Icons.add),
            )
          : null,
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return Container(
            child: provider.isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Shimmer.fromColors(
                        enabled: true,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Center(
                              child: CarouselIndicator(
                                count: 4,
                                color: Colors.grey,
                                index: 0,
                                activeColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 240,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    );
                                  })),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[100]!),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    SlideDrawer.of(context)?.open();
                                  },
                                  icon: Icon(Icons.menu)),
                              TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchScreen()));
                                  },
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent)),
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Search",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: CarouselSlider(
                              items: provider.carousel.map((item) {
                                return Builder(builder: (BuildContext context) {
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: 30, left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                item.name.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                top: 5,
                                              ),
                                              child: Text(
                                                "Released ${item.released}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Row(
                                                children: [
                                                  RatingBarIndicator(
                                                      itemSize: 18,
                                                      itemCount: 5,
                                                      rating: item.rating,
                                                      unratedColor: Colors.grey,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        );
                                                      }),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "${item.rating} / 5.0",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                item.background_image),
                                            fit: BoxFit.cover)),
                                  );
                                });
                              }).toList(),
                              options: CarouselOptions(
                                  onPageChanged: (x, y) {
                                    setState(() {
                                      index = x;
                                    });
                                  },
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  height: MediaQuery.of(context).size.height *
                                      0.30)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselIndicator(
                            color: Colors.black,
                            count: provider.carousel.length,
                            index: index),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Games",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewAll()));
                                },
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[100],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.popular.sublist(0, 5).length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    SingleGame(
                                                      game: provider
                                                          .popular[index],
                                                    ))));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          provider
                                                              .popular[index]
                                                              .background_image),
                                                  onError: (ee, e) => Image(
                                                      image: AssetImage(
                                                          Images.gaming)),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text(
                                              provider.popular[index].name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "${provider.popular[index].rating}/5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              })),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recent games",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[100],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Column(
                          children: provider.games.map((e) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingleGame(
                                              game: e,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            height: 130,
                                            width: 90,
                                            imageUrl: e.background_image,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, err) =>
                                                Image(
                                                    image: AssetImage(
                                                        Images.gaming)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 130,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                e.name,
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
                                                children: e.genres.map((e) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
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
                                                  rating: e.rating,
                                                  itemBuilder:
                                                      ((context, index) {
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
                            );
                          }).toList(),
                        )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ));
      }),
    );
  }
}

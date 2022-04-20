import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/services/service_locator.dart';
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
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    logger.e(Provider.of<HomeProvider>(context, listen: false).games);
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.30,
                              decoration: BoxDecoration(color: Colors.grey),
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
                          child: CarouselSlider(
                              items: provider.carousel.map((item) {
                                return Builder(builder: (BuildContext context) {
                                  return Container(
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
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                item.background_image),
                                            fit: BoxFit.cover)),
                                  );
                                });
                              }).toList(),
                              options: CarouselOptions(
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  height: MediaQuery.of(context).size.height *
                                      0.35)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              itemCount: provider.popular.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .push(MaterialPageRoute(
                                        //         builder: ((context) => SingleGame(
                                        //               game: games[index],
                                        //               user: user,
                                        //             ))));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Container(
                                          height: 200,
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 10, left: 10),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                          width: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          provider
                                                              .popular[index]
                                                              .background_image),
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
                          children: provider.games.sublist(0, 5).map((e) {
                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SingleGame(
                                //               game: e,
                                //               user: user,
                                //             )));
                              },
                              child: Card(
                                child: Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Center(
                                        child: Image(
                                          height: 70,
                                          width: 70,
                                          image: CachedNetworkImageProvider(
                                              e.background_image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Center(
                                        child: Text("${e.name}"),
                                      ),
                                      Center(
                                        child: Text("${e.rating} / 5.0"),
                                      )
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

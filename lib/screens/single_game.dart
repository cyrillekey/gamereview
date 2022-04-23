import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/models/game_details.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SingleGame extends StatefulWidget {
  final int game_id;
  const SingleGame({Key? key, required this.game_id}) : super(key: key);

  @override
  State<SingleGame> createState() => _SingleGameState();
}

double reviewvalue = 1;
bool pressed = false;

class _SingleGameState extends State<SingleGame> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> loadItem() async {
    gameDetails =
        await Provider.of<HomeProvider>(context).getSingleGame(widget.game_id);
    return true;
  }

  Future<void> dummy() async {}
  late GameDetails gameDetails;
  TextEditingController review = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: loadItem(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios_new)),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.more_horiz),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width * 0.5,
                                image: CachedNetworkImageProvider(
                                    gameDetails.background_image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                children: [
                                  Text(
                                    gameDetails.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: gameDetails.genres.map((e) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Text(
                                          "${e.name} .",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        gameDetails.released,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                          itemSize: 15,
                                          rating: gameDetails.rating,
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            );
                                          }),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${gameDetails.rating}/5.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Platforms",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: ListView.builder(
                            itemCount: gameDetails.platforms.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              String? name =
                                  gameDetails.platforms[index].platform?.image;
                              String image = "";
                              if (name == "playstation5") {
                                image = Images.ps5_logo;
                              } else if (name == "playstation4") {
                                image = Images.ps4_logo;
                              } else if (name == "playstation3") {
                                image = Images.ps3_logo;
                              } else if (name == "playstation2") {
                                image = Images.ps2_logo;
                              } else if (name == "macos") {
                                image = Images.mac_logo;
                              } else if (name == "ios") {
                                image = Images.ios_logo;
                              } else if (name == "nintendo-switch") {
                                image = Images.switch_logo;
                              } else if (name == "pc") {
                                image = Images.windows_logo;
                              } else if (name == "xbox-one") {
                                image = Images.xbox_one;
                              } else if (name == "xbox-series-x") {
                                image = Images.xbox_series;
                              } else {
                                image = Images.gaming;
                              }
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(image),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              );
                            })),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[300],
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    gameDetails.description,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Shimmer.fromColors(
                    enabled: true,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          color: Colors.grey[400],
                        )
                      ],
                    ),
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!),
              );
            }),
      ),
    );
  }
}

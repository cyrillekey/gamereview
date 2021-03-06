import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/favourites_provider.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/controllers/review_provider.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/models/game_details.dart';
import 'package:gamereview/utils/get_platform_logo.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleGame extends StatefulWidget {
  final Game game;
  const SingleGame({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<SingleGame> createState() => _SingleGameState();
}

class _SingleGameState extends State<SingleGame> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteProvider>(context, listen: false).getFavourites();
    Provider.of<ReviewProvider>(context, listen: false)
        .getAllReviews(widget.game.id);
  }

  Future<bool> loadItem() async {
    gameDetails =
        await Provider.of<HomeProvider>(context).getSingleGame(widget.game.id);
    return true;
  }

  final TextEditingController reviewController = TextEditingController();
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
                return Consumer<FavouriteProvider>(
                    builder: (context, favouriteProvider, child) {
                  return Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
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
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  image: CachedNetworkImageProvider(
                                      gameDetails.background_image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Wrap(
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
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Text(
                                          gameDetails.released,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
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
                                      ),
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Text(
                                    "${gameDetails.metacritic}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: gameDetails.metacritic > 74
                                      ? Colors.green
                                      : gameDetails.metacritic > 49
                                          ? Colors.amber
                                          : Colors.red,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(gameDetails.metacritic_url),
                                    mode: LaunchMode.platformDefault);
                              },
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text(
                                        "Metacritic",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Text(
                                        "${gameDetails.reviews_count} User Reviews",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 50,
                              child: VerticalDivider(
                                width: 0,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(
                                  text: "Publisher: ",
                                  children: [
                                    TextSpan(
                                        text: gameDetails.publisher.length > 0
                                            ? gameDetails.publisher[0].name
                                            : "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400))
                                  ],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: "Website: ",
                                      children: [
                                        TextSpan(
                                            text: gameDetails.website,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400))
                                      ],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
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
                                    gameDetails.platforms[index].platform?.slug;
                                String image = getPlatformImage(name!);

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(image),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                );
                              })),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                if (favouriteProvider
                                    .isFavourite(gameDetails)) {
                                  favouriteProvider
                                      .deleteFavoutire(gameDetails.id);
                                } else {
                                  favouriteProvider.saveFavourite(widget.game);
                                }
                              },
                              child: Column(
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.favorite,
                                      size: 30,
                                      color: favouriteProvider
                                              .isFavourite(gameDetails)
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: favouriteProvider
                                            .isFavourite(gameDetails)
                                        ? Text("Unlist")
                                        : Text("List"),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Column(
                                children: [
                                  Center(
                                    child: Icon(Icons.trending_up),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Track"),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Column(
                                children: [
                                  Center(
                                    child: Icon(Icons.monetization_on_outlined),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Buy"),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Column(
                                children: [
                                  Center(
                                    child: Icon(Icons.share),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("Share"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 00.0),
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
                                padding: const EdgeInsets.only(left: 0.0),
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
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Consumer<ReviewProvider>(
                            builder: (context, reviewProvider, child) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemCount: reviewProvider.reviews.length,
                                  itemBuilder: (context, index) => Card(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      )));
                        }),
                        Container(
                            child: TextField(
                          controller: reviewController,
                          maxLines: 5,
                          decoration: InputDecoration(
                              labelText: "Review",
                              hintText: "Write Review...",
                              border: OutlineInputBorder()),
                        )),
                        TextButton(
                            onPressed: () {
                              Provider.of<ReviewProvider>(context,
                                      listen: false)
                                  .saveReview(widget.game.id.toString(), {
                                "title": "testing",
                                "review": reviewController.text.trim(),
                                "rating": 4,
                                "user": {
                                  "name": "testing",
                                  "email": "testing@mail.com",
                                  "avatar": "plas.m"
                                }
                              });
                            },
                            child: Text("Send"))
                      ],
                    ),
                  );
                });
              }
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Shimmer.fromColors(
                    enabled: true,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 80,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.19,
                                          height: 30,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.19,
                                          height: 30,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    RatingBarIndicator(
                                        itemSize: 20,
                                        itemBuilder: (context, index) {
                                          return Icon(Icons.star);
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              width: 150,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!),
              );
            }),
      ),
    );
  }
}

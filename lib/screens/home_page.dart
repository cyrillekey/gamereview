import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/models/game_body.dart';
import 'package:gamereview/models/user.dart';
import 'package:gamereview/screens/add_game.dart';
import 'package:gamereview/screens/log_in.dart';
import 'package:gamereview/screens/single_game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = [];

  final dio = Dio();
  List<GameBody> games = [];
  bool show = true;
  late User? user;
  Future loadItems() async {
    final dio = Dio();
    Response response = await dio
        .get("https://scaletoday-heliumharbor-8080.codio-box.uk/get-all-games");
    var data = response.data;
    List<GameBody> temp = [];
    (data["body"] as List).forEach((element) {
      temp.add(GameBody.fromJson(element));
    });
    print(games);
    games = temp;
    // dio
    //     .get("https://scaletoday-heliumharbor-8080.codio-box.uk/get-all-games")
    //     .then((value) {
    //   var data = value.data;
    //   List<GameBody> temp = [];
    //   (data["body"] as List).forEach((element) {
    //     temp.add(GameBody.fromJson(element));
    //   });
    //   games = temp;
    // });
    // if (response.statusCode == 200) {

    // }
    return games;
  }

  @override
  void initState() {
    super.initState();
    checkUser().then((val) {
      show = val;
    });
    // loadItems();
  }

  Future<bool> checkUser() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if (myPrefs.getString("user") != null) {
      user = User.fromJson(jsonDecode(myPrefs.getString("user")!));
      return true;
    } else {
      user = null;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      loadItems();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        toolbarHeight: 60,
        leading: Center(
          child: Icon(
            Icons.logo_dev,
            size: 35,
          ),
        ),
        actions: [
          show
              ? IconButton(
                  onPressed: () async {
                    SharedPreferences sharedPreference =
                        await SharedPreferences.getInstance();
                    sharedPreference.remove("user");
                    checkUser();
                    setState(() {
                      checkUser();
                    });
                  },
                  icon: Icon(Icons.logout),
                  tooltip: "Logout",
                )
              : IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Icon(Icons.login))
        ],
      ),
      floatingActionButton: show
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddGame(
                              user: user!,
                            )));
              },
              label: Text("Add game"),
              icon: Icon(Icons.add),
            )
          : null,
      body: FutureBuilder(
          future: loadItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: CarouselSlider(
                          items: games.map((item) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 30, left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          item.game_name.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 200,
                                          margin:
                                              EdgeInsets.only(top: 5, left: 20),
                                          child: Text(
                                            "Released ${item.publish_year}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width: 200,
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              RatingBarIndicator(
                                                  itemSize: 18,
                                                  itemCount: 5,
                                                  rating:
                                                      item.game_rating ?? 1.0,
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
                                                "${item.game_rating} / 5.0",
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
                                    border: Border.all(),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(item.imageLink ?? ''),
                                        fit: BoxFit.cover)),
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.35)),
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
                          itemCount: games.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: ((context) => SingleGame(
                                                  game: games[index],
                                                  user: user,
                                                ))));
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
                                              image: NetworkImage(
                                                  games[index].imageLink ?? ""),
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
                                          games[index].game_name ?? "",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "${games[index].game_rating}/5",
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
                      children: games.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleGame(
                                          game: e,
                                          user: user,
                                        )));
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
                                      image: NetworkImage(e.imageLink ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Center(
                                    child: Text("${e.game_name}"),
                                  ),
                                  Center(
                                    child: Text("${e.game_rating} / 5.0"),
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

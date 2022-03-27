import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/screens/add_game.dart';
import 'package:gamereview/screens/single_game.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var count = [
    1,
    2,
    3,
  ];
  int rating = 4;
  @override
  Widget build(BuildContext context) {
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGame()));
        },
        label: Text("Add game"),
        icon: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: CarouselSlider(
                  items: [1, 2, 3].map((item) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Watch Dogs 2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 200,
                                  margin: EdgeInsets.only(top: 5, left: 20),
                                  child: Text(
                                    "Released 2020",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: count.map((e) {
                                          return Container(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "4.25 / 5.0",
                                        style: TextStyle(color: Colors.white),
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
                                image: AssetImage('assets/img/watch-dogs.jpg'),
                                fit: BoxFit.cover)),
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height * 0.35)),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => SingleGame())));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              height: 200,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(bottom: 10, left: 10),
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
                                      image: AssetImage(
                                          'assets/img/watch-dogs.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Watch Dogs 2"),
                              Text(
                                "4.5/5",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              children: count.map((e) {
                return Card(
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Image(
                            height: 70,
                            width: 70,
                            image: AssetImage('assets/img/watch-dogs.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Text("Movie Name"),
                        ),
                        Center(
                          child: Text("View"),
                        )
                      ],
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
      ),
    );
  }
}

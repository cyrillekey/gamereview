import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/models/game_body.dart';
import 'package:gamereview/models/review_body.dart';
import 'package:gamereview/models/user.dart';

class SingleGame extends StatefulWidget {
  final GameBody game;
  final User? user;
  const SingleGame({Key? key, required this.game, required this.user})
      : super(key: key);

  @override
  State<SingleGame> createState() => _SingleGameState();
}

double reviewvalue = 1;
bool pressed = false;

class _SingleGameState extends State<SingleGame> {
  List<Review> reviews = [];
  final Dio dio = Dio();
  Future loadItems() async {
    Response response = await dio.get(
        "https://scaletoday-heliumharbor-8080.codio-box.uk/get-reviews/${widget.game.game_id}");

    var data = response.data;
    List<Review> temp = [];
    print(data);
    (data["body"] as List).forEach((element) {
      temp.add(Review.fromJson(element));
    });
    reviews = temp;
    return reviews;
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController review = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.game_name ?? "Game Name"),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.game.imageLink ?? ""),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.game.game_name}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.game.game_rating}/5.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBarIndicator(
                        itemCount: 5,
                        itemSize: 20,
                        rating: widget.game.game_rating ?? 1.00,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("${widget.game.game_publisher}"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${widget.game.publish_year}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
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
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                            "${widget.game.game_description}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: loadItems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: reviews.map((e) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          width: 200,
                                          child: Text("${e.user_name}")),
                                      Container(
                                          width: 200,
                                          child: Text(
                                              "User Rating: ${e.review_rating}")),
                                      Container(
                                          width: 200,
                                          child: Text(
                                              "Date Posted: ${e.review_time?.year}"))
                                    ],
                                  ),
                                  RatingBarIndicator(
                                    rating: e.review_rating ?? 4.0,
                                    itemSize: 10,
                                    itemBuilder: ((context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              widget.user != null
                  ? Column(
                      children: [
                        Center(
                          child: Text(
                            "Leave Review",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: review,
                            maxLines: 5,
                            decoration: InputDecoration(
                                labelText: "Review",
                                hintText: "Leave Review",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Slider(
                            divisions: 5,
                            value: reviewvalue,
                            max: 5,
                            min: 1,
                            label: "${reviewvalue.toInt()}/5",
                            onChanged: (value) {
                              setState(() {
                                reviewvalue = value;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: !pressed
                              ? () {
                                  print(widget.user?.user_id ?? "");
                                  setState(() {
                                    pressed = !pressed;
                                  });
                                  saveReview();
                                }
                              : null,
                          child: !pressed
                              ? Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                )
                              : CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.pink),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(180, 60))),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future saveReview() async {
    Dio()
        .get(
            "https://scaletoday-heliumharbor-8080.codio-box.uk/save-review/${widget.user!.user_id}/game-id/${widget.game.game_id}/$reviewvalue/${review.text}/")
        .then((value) {
      if (value.statusCode == 200) {
        loadItems();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Sucess"),
                  content: Text("review added"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"))
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("Review failed"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"))
                  ],
                ));
      }
      setState(() {
        pressed = !pressed;
      });
    });
  }
}

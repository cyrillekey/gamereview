import 'package:flutter/material.dart';

class SingleGame extends StatefulWidget {
  const SingleGame({Key? key}) : super(key: key);

  @override
  State<SingleGame> createState() => _SingleGameState();
}

double reviewvalue = 1;

class _SingleGameState extends State<SingleGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single game"),
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
                        image: AssetImage('assets/img/watch-dogs.jpg'),
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
                            "Watch Dogs 2",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "4.5/5.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("Take Two Interactive"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("2021"),
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
                            "lorem",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
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
              Column(
                children: [1, 2, 3, 4].map((e) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width: 200, child: Text("John Doe")),
                              Container(
                                  width: 200, child: Text("User Rating: 4.5")),
                              Container(
                                  width: 200,
                                  child: Text("Date Posted: 12/3/16"))
                            ],
                          ),
                          Text("u/A"),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Leave Review",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: "Review",
                      hintText: "Leave Review",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
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
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    fixedSize: MaterialStateProperty.all<Size>(Size(180, 60))),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

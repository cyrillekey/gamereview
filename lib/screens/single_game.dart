import 'package:flutter/material.dart';

class SingleGame extends StatelessWidget {
  const SingleGame({Key? key}) : super(key: key);

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
                          CircleAvatar(
                            backgroundColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

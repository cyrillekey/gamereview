import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  ViewAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(itemBuilder: (context, index) {
              return Container();
            }),
          )
        ],
      )),
    );
  }
}

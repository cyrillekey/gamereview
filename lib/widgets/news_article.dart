import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget newsAricle(BuildContext context, String tag, String title,
    String imageUrl, String preview) {
  return Card(
    child: Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 100,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.green,
                          Colors.redAccent,
                          Colors.red.shade700
                        ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                        alignment: Alignment.centerLeft, child: Text(tag)),
                  )
                ],
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    ),
  );
}

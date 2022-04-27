import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget newsAricle(String tag, String title, String imageUrl, String preview) {
  return Card(
    child: Row(
      children: [
        Container(
            child: Column(
          children: [],
        )),
        CachedNetworkImage(imageUrl: imageUrl)
      ],
    ),
  );
}

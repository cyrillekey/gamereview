import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:gamereview/utils/images.dart';
import 'package:slide_drawer/slide_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      SlideDrawer.of(context)?.open();
                    },
                    icon: Icon(Icons.menu)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sunny),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              width: 200,
              image: AssetImage(Images.gaming),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "John Doe",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Johndoe@gmail.com",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          profileMenu(Icons.privacy_tip, "Privacy")
        ],
      ),
    );
  }

  Container profileMenu(IconData icon, String title) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
    );
  }
}

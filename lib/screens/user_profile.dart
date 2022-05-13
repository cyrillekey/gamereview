import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:gamereview/services/file_service.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/images.dart';
import 'package:slide_drawer/slide_drawer.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FilePickerResult? _results;
  var image;
  @override
  void initState() {
    image = AssetImage(Images.gaming);
    super.initState();
  }

  pickFile() async {
    _results = await FilePicker.platform.pickFiles(type: FileType.image);
    setState(() {
      image = FileImage(File(_results!.files.first.path!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    pickFile();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  iconSize: 40,
                  color: Colors.grey.shade400,
                ),
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
            SizedBox(
              height: 20,
            ),
            profileMenu(Icons.account_box_rounded, "User Name"),
            profileMenu(Icons.email, "Email"),
            TextButton(
                onPressed: () async {
                  String url = await FileService()
                      .uploadImage(File(_results!.files.first.path!));
                  logger.i(url);
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }

  profileMenu(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            labelText: title,
            prefixIcon: Icon(icon),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(60))),
      ),
    );
  }
}

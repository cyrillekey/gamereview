import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddGame extends StatefulWidget {
  AddGame({Key? key}) : super(key: key);

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  double year = 1970.00;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Game"),
        automaticallyImplyLeading: true,
        actions: [
          Center(
            child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
              child: Column(
            children: [
              result != null && result!.files.isNotEmpty
                  ? Image.file(
                      File(result!.files[0].path ?? ''),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.contain,
                    )
                  : SizedBox(
                      height: 10,
                    ),
              TextButton(
                  onPressed: () async {
                    result = await FilePicker.platform.pickFiles();
                    setState(() {});
                  },
                  child: Text("Pick Image")),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Game Name"),
                    hintText: 'Enter game name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Publisher"),
                    hintText: 'Enter Publisher Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 8,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Publisher"),
                    hintText: 'Enter Publisher Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Release Year"),
              ),
              Slider(
                min: 1970,
                max: (DateTime.now().year).toDouble(),
                value: year,
                divisions: ((DateTime.now().year) - 1970),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    year = value;
                  });
                },
                activeColor: Colors.pink,
                label: year.toInt().toString(),
                inactiveColor: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

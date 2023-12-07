import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                ),

              ), //pembuatan tombol akhir
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
              ),
              Text("Lands Farmer"),
            ],
          ),
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
              const SizedBox(height: 24),
              Text(picture.name)
            ]),
          ),
        ],
      ),
    );
  }
}
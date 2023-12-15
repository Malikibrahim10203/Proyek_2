import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:smartfarm/model/response_model.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture, required this.apiResponse}) : super(key: key);

  final XFile picture;
  final ApiResponse apiResponse; // Change the type here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
              ),
              Text("Lands Farmer"),
            ],
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
                const SizedBox(height: 24),
                Text(picture.name),
                SizedBox(height: 16),
                Text("Prediction: ${apiResponse.prediction}"),
                Text("Confidence: ${apiResponse.confidence}"),
                Text("Description: ${apiResponse.description}"),
                Text("Pengendalian Hayati: ${apiResponse.pengendalianHayati}"),
                Text("Pengendalian Kimiawi: ${apiResponse.pengendalianKimiawi}"),
                // Tambahkan widget lain sesuai kebutuhan
              ],
            ),
          ),
        ],
      ),
    );
  }
}
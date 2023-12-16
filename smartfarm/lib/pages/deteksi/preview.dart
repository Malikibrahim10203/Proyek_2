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
      appBar: AppBar(
        title: Text("Preview Deteksi", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.file(File(picture.path), fit: BoxFit.fill,),
              SizedBox(height: 24),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Prediction: ${apiResponse.prediction}"),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("Confidence: ${apiResponse.confidence}"),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("Description: ${apiResponse.description}"),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("Pengendalian Hayati: ${apiResponse.pengendalianHayati}"),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("Pengendalian Kimiawi: ${apiResponse.pengendalianKimiawi}"),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),






            ],
          ),
        ],
      )
    );
  }
}
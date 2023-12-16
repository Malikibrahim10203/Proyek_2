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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.black12
                ),
                child: Icon(Icons.search, color: Colors.black,),
                onPressed: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 1,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text("Deteksi", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                              ),
                              DataColumn(
                                  label: Text("Hasil", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)
                              ),
                            ],
                            rows: [
                              DataRow(
                                  cells: [
                                    DataCell(
                                      Text("Prediction: "),
                                    ),
                                    DataCell(
                                        Text("${apiResponse.prediction}")
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      Text("Confidence: "),
                                    ),
                                    DataCell(
                                        Text("${apiResponse.confidence}")
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      Text("Description: "),
                                    ),
                                    DataCell(
                                        Text("${apiResponse.description}")
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      Text("Pengendalian Hayati: "),
                                    ),
                                    DataCell(
                                        Text("${apiResponse.pengendalianHayati}")
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      Text("Pengendalian Kimiawi: "),
                                    ),
                                    DataCell(
                                        Text("${apiResponse.pengendalianKimiawi}")
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
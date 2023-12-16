import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/pages/deteksi/camera.dart';

class DeteksiPage extends StatefulWidget {
  const DeteksiPage({Key? key}) : super(key: key);

  @override
  State<DeteksiPage> createState() => _DeteksiPageState();
}

class _DeteksiPageState extends State<DeteksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deteksi", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn sisip",
            backgroundColor: Colors.white,
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
            },
            child: Icon(
              Icons.folder,
              color: Color(0xff545454),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: "btn capture",
            backgroundColor: Colors.white,
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
            },
            child: Icon(
              Icons.camera_alt_outlined,
              color: Color(0xff545454),
            ),
          ),
        ],
      ),
    );
  }
}

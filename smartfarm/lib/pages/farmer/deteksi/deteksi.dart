import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';
import 'package:smartfarm/pages/farmer/deteksi/camera.dart';

class DeteksiPage extends StatefulWidget {
  const DeteksiPage({Key? key}) : super(key: key);

  @override
  State<DeteksiPage> createState() => _DeteksiPageState();
}

class _DeteksiPageState extends State<DeteksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
          ],
        )
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

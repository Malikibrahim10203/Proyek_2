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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () async {
                    await availableCameras().then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 35,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

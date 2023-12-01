import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/detail_land/overview.dart';
import 'package:smartfarm/pages/farmer/add/tambah_device.dart';
import 'package:smartfarm/pages/farmer/edit/edit_devices.dart';
import 'package:smartfarm/widget/info.dart';

class ManageDevice extends StatefulWidget{
  const ManageDevice({super.key, required this.id});
  
  final String id;

  @override
  State<ManageDevice> createState() => _ManageDevice();
}

class _ManageDevice extends State<ManageDevice>{

  List<Device> listDevice = [];
  void getDevice() async {
    listDevice = await EventDB.getDetailDevice(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    getDevice();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => Overview(id: widget.id),));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                ),
                Text("Manage Device"),
              ],
            ),
            SizedBox(
              height: 40,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: listDevice.length,
                itemBuilder: (context, index) {
                  Device device = listDevice[index];
                  return Card(
                    child: ListTile(
                      title: Text(device.name??''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home_outlined,
              ),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Overview(id: widget.id)));},
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.sensor_window,
                ),
                onPressed: () { },
              ),
              label: 'Device'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.camera
              ),
              label: 'Deteksi Padi'
          ),
        ],
      ),
    );
  }

}

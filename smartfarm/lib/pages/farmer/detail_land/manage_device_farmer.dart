import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/detail_land/overview.dart';
import 'package:smartfarm/pages/farmer/detail_land/map_farmer.dart';
import 'package:smartfarm/pages/farmer/detail_land/overview_farmer.dart';
import 'package:smartfarm/pages/farmer/edit/edit_devices.dart';

class ManageDeviceFarmer extends StatefulWidget{
  const ManageDeviceFarmer({super.key, required this.id});
  
  final String id;

  @override
  State<ManageDeviceFarmer> createState() => _ManageDevice();
}

class _ManageDevice extends State<ManageDeviceFarmer>{

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => OverviewFarmer(id: widget.id),));
                  }, icon: Icon(
                  Icons.arrow_back_outlined,
                ),
                ),
                Text("Manage Device"),
                OutlinedButton(
                  onPressed: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      "+ Tambah Device",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54
                      ),
                    ),
                  ),
                )
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditDevice(id: device.id, name: device.name, land_id: device.landId)));
                            },
                            icon: Icon(Icons.edit, color:  Colors.blue,),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.delete, color: Colors.red,),
                          ),
                        ],
                      ),
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
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>OverviewFarmer(id: widget.id)));},
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
              icon: IconButton(
                icon: Icon(
                  Icons.camera,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MapFarmer()));},
              ),
              label: 'Deteksi Padi'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.settings
              ),
              label: 'Settings'
          ),
        ],
      ),
    );
  }

}

import 'package:confirm_dialog/confirm_dialog.dart' as confirm;
import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/detail_land/overview.dart';
import 'package:smartfarm/pages/farmer/add/tambah_device.dart';
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
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppBar(
        title: Text("Manage Device", style: TextStyle(color: Color(0xff545454)),),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
            color: Color(0xff545454)
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listDevice.length,
                itemBuilder: (context, index) {
                  Device device = listDevice[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.sensor_window, color: Color(0xff408CFF)),
                          ),
                          title: Text(device.id??'', style: TextStyle(fontSize: 12),),
                          subtitle: Text(device.name??'', style: TextStyle(fontSize: 9),),
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
                                onPressed: () async {
                                  if(
                                  await confirm.confirm(
                                    context,
                                    title: Text("Alert!"),
                                    content: Text("Apakah anda ingin hapus?"),
                                    textOK: Text("Ya"),
                                    textCancel: Text("Tidak"),
                                  )
                                  ) {
                                    EventDB.deleteDevice(device.id??'');
                                  }
                                  return print('pressedNo');
                                },
                                icon: Icon(Icons.delete, color: Colors.red,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahDevice(id: widget.id)));
            },
            child: Icon(Icons.add, color: Color(0xff545454)),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

}

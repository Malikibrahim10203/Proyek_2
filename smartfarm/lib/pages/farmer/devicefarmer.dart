import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';

class Devicefarmer extends StatefulWidget{
  @override
  State<Devicefarmer> createState() => _Devicefarmer();
}

class _Devicefarmer extends State<Devicefarmer>{

  List<Device> listDevice =[];
  void getDevice() async {
    listDevice = await EventDB.getDevice();
    setState(() {});
  }

  @override
  void initState() {
    getDevice();
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
                        builder: (context) => DashboardFarmer(),));
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
                      "+ Tambah lahan",
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
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listDevice.length,
                itemBuilder: (context, index) {
                  Device device = listDevice[index];
                  if (index == 0){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          Text(
                            "Aksi",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  index -= 1;
                  return ListTile(
                    leading: Text('${index+1}'),
                    title: Text(device.name?? ''),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

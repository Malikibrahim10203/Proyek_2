import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';
import 'package:smartfarm/pages/farmer/add/tambah_map_farmer.dart';
import 'package:smartfarm/pages/farmer/edit/edit_map_farmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:smartfarm/widget/info.dart';

class EditLand extends StatefulWidget{
  const EditLand({super.key, required this.id, required this.name, required this.description, required this.maps, required this.status, required this.date, required this.userId}); 
  final id; 
  final String? name; 
  final String? description;
  final String? maps;
  final String? status;
  final String? date;
  final String? userId;

  @override
  State<EditLand> createState() => _EditLandState();
}

class _EditLandState extends State<EditLand>{
String? id_land;
String? name;
String?user_id;

  var controllerName;
  var controllerDescription;
  var controllerMaps;
  var controllerStatus;
  var controllerTanggal = TextEditingController();
  var formKey         = GlobalKey<FormState>();

  var status = ["sudah panen", "belum panen"];
  var dropdownValue = "belum panen";

  DateTime tanggal = DateTime.now();
List<Land> listLand = [];

  String? description;
  
  String? map;
  
  String? tgl;

void getLand() async{

  listLand = await EventDB.getDetailLandbyUser(widget.id);
  setState(() {});
}

  @override
  void initState() {
    // id_land = widget.id;
    name = widget.name;
    description = widget.description;
    map = widget.maps;
    dropdownValue = widget.status??'';
    tgl = widget.date;
    user_id = widget.userId;

    controllerTanggal.text = "${tanggal.year}-${tanggal.month}-${tanggal.day}";

    // controllerId = TextEditingController(text: id_land);
    controllerName = TextEditingController(text : name);
    controllerDescription = TextEditingController(text: description);
    controllerMaps = TextEditingController(text: map);
    
    controllerTanggal = TextEditingController(text: tgl);

    getLand();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, top: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LandFarmer(id: widget.userId??'')));
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                      ),

                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                    ), //pembuatan tombol akhir
                    Text("Edit Land"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 50, top: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 240,
                              height: 60,
                              child: TextFormField(
                                controller: controllerName,
                                validator: (value) => value == ''? 'Jangan Kosong':null,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: OutlineInputBorder(),
                                  labelText: "Enter Name...",
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 240,
                              height: 60,
                              child: TextFormField(
                                controller: controllerDescription,
                                validator: (value) => value == ''? 'Jangan Kosong':null,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: OutlineInputBorder(),
                                  labelText: "Enter Description...",
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditMapFarmer(id: widget.id, name: name, description: description, coordinate: map, status: dropdownValue, date: tgl, userId: user_id)));
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.map_outlined),
                                              SizedBox(width: 10,),
                                              Text("Select Maps"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Status Tanaman",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                                width: 150,
                                height: 70,
                                child: DropdownButton(
                                  value: dropdownValue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: status.map((String status) {
                                    return DropdownMenuItem(
                                      value: status,
                                      child: Text(status),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: [
                                Text('${tanggal.year}/${tanggal.month}/${tanggal.day}'),

                                SizedBox(
                                  height: 16,
                                ),

                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green
                                    ),
                                    onPressed: () async{
                                      DateTime? newTanggal = await showDatePicker(
                                        context: context,
                                        initialDate: tanggal,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );

                                      if(newTanggal == null) return;

                                      setState(() {
                                        tanggal = newTanggal;
                                        controllerTanggal.text = tgl??'';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.date_range),
                                        SizedBox(width: 10,),
                                        Text("Select Date"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.59,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green
                                ),
                                child: const Text('Ubah Lahan'),
                                onPressed: () {
                                  EventDB.editLahan(widget.id, controllerName.text, controllerDescription.text, 
                                  widget.maps??'', dropdownValue, controllerTanggal.text, user_id??'');
                                  controllerName.clear();
                                  controllerDescription.clear();
                                  controllerMaps.clear();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
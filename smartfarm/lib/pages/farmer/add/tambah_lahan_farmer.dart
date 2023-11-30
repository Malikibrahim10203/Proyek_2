import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/farmer/add/tambah_map_farmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';


class TambahLahanFarmer extends StatefulWidget {
  const TambahLahanFarmer({super.key, required this.id, required this.coordinate});

  final id;
  final coordinate;

  @override
  State<TambahLahanFarmer> createState() => _TambahLahanFarmerState();
}

class _TambahLahanFarmerState extends State<TambahLahanFarmer> {
  var controllerName = TextEditingController();
  var controllerDescription = TextEditingController();
  var controllerMaps = TextEditingController();
  var controllerStatus = TextEditingController();
  var controllerTanggal;
  var formKey         = GlobalKey<FormState>();

  var status = ["sudah panen", "belum panen"];
  var dropdownValue = "belum panen";

  DateTime tanggal = DateTime.now();


  List<User> listUser = [];
  void getUser() async {
    listUser = await EventDB.getUser();
    setState(() {});
  }

  @override
  void initState() {

    controllerTanggal = "${tanggal.year}-${tanggal.month}-${tanggal.day}";
    getUser();
    // TODO: implement initState
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LandFarmer(id: widget.id)));
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                      ),

                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                    ), //pembuatan tombol akhir
                    Text("Tambah User"),
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahMapFarmer(id: widget.id)));
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
                                )
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
                                        controllerTanggal = "${tanggal.year}-${tanggal.month}-${tanggal.day}";
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
                                child: const Text('Tambah Lahan'),
                                onPressed: () {
                                  EventDB.addLahan(controllerName.text, controllerDescription.text, widget.coordinate, dropdownValue, controllerTanggal, widget.id);
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


import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';

class TambahDevice extends StatefulWidget {
  const TambahDevice({super.key, required this.id});
  
  final String id;

  @override
  State<TambahDevice> createState() => _TambahDeviceState();
}

class _TambahDeviceState extends State<TambahDevice> {
  String? land_id;

  

  var controllerId = TextEditingController();
  var controllerNameDevice = TextEditingController();
  var controllerLandId;

  var formKey         = GlobalKey<FormState>();

  List<Land> listLand = [];
  void getLand() async {

    listLand = await EventDB.getDetailLandbyUser(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    land_id = widget.id;

    controllerLandId = TextEditingController(text: land_id);
    getLand();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
      appBar: AppBar(
        title: Text("Add Device", style: TextStyle(color: Color(0xff545454))),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
            color: Color(0xff545454)
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, top:  30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.7,
                  
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 65,
                            child: TextFormField(
                              controller: controllerId,
                              validator: (value) => value == ''?'Jangan Kosong':null,
                              decoration: InputDecoration(
                                helperText: ' ',
                                border: OutlineInputBorder(),
                                labelText: "Enter Id Device..",
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                prefixIcon: Icon(Icons.person_outline, size: 20,),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffECECEC)
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 65,
                            child: TextFormField(
                              controller: controllerNameDevice,
                              validator: (value) => value == ''?'Jangan Kosong':null,
                              decoration: InputDecoration(
                                helperText: ' ',
                                border: OutlineInputBorder(),
                                labelText: "Enter Name Device..",
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                prefixIcon: Icon(Icons.file_copy_outlined, size: 20,),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffECECEC)
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: ElevatedButton(
                              child: const Text('Tambah Data'),
                              onPressed: () {
                                EventDB.addDevices(controllerId.text, controllerNameDevice.text, controllerLandId.text);
                                controllerId.clear();
                                controllerNameDevice.clear();
                                controllerLandId.clear();
                              },
                            ),
                          ),
                        ],
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
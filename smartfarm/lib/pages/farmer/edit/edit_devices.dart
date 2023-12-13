import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';
import 'package:smartfarm/widget/info.dart';

class EditDevice extends StatefulWidget{
  const EditDevice({super.key, required this.id, required this.name, required this.land_id}); 
  final id; 
  final String? name; 
  final String? land_id;

  @override
  State<EditDevice> createState() => _EditDeviceState();
}

class _EditDeviceState extends State<EditDevice>{
String? id_devices;
String? name;
String?land_id;

var controllerId;
var controllerId_old;
var controllerName;
var controllerLandId;
var formKey = GlobalKey<FormState>();

List<Land> listLand = [];

void getLand() async{

  listLand = await EventDB.getDetailLandbyUser(widget.id);
  setState(() {});
}

  @override
  void initState() {
    id_devices = widget.id;
    name = widget.name;
    land_id = widget.land_id;

    controllerId = TextEditingController(text: id_devices);
    controllerId_old = TextEditingController(text: id_devices);
    controllerName = TextEditingController(text : name);
    controllerLandId =TextEditingController(text :land_id);
    getLand();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
      appBar: AppBar(
        title: Text("Edit Device", style: TextStyle(color: Color(0xff545454)),),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xff545454),
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
                  padding: EdgeInsets.only(left: 20, top: 30, right: 20),
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
                              labelText: "Enter ID Device..",
                              labelStyle: TextStyle(
                                fontSize: 12,
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
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 65,
                          child: TextFormField(
                            controller: controllerName,
                            validator: (value) => value == ''?'Jangan Kosong':null,
                            decoration: InputDecoration(
                              helperText: ' ',
                              border: OutlineInputBorder(),
                              labelText: "Enter Name Device..",
                              labelStyle: TextStyle(
                                fontSize: 12,
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
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(
                            child: const Text('Ubah Data'),
                            onPressed: () {
                              EventDB.EditDevices(controllerId.text, controllerId_old.text, controllerName.text, controllerLandId.text);
                              controllerId.clear();
                              controllerId_old.clear();
                              controllerName.clear();
                              controllerLandId.clear();
                            },
                          ),
                        ),
                      ],
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
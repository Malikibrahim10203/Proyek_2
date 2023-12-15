import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/farmer/add/tambah_map_farmer.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';


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

  var controllerLuasLahan = TextEditingController();

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
      appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(color: Colors.black),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Color(0xff545454)
          ),
          title: Text("Tambah Lahan")
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, top: 50, right: MediaQuery.of(context).size.width * 0.1),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextFormField(
                        controller: controllerName,
                        validator: (value) => value == ''? 'Jangan Kosong':null,
                        decoration: InputDecoration(
                          helperText: ' ',
                          border: OutlineInputBorder(),
                          labelText: "Enter Name...",
                          prefixIcon: Icon(Icons.person_outline, size: 20,),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffECECEC)
                            )
                        ),
                          labelStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextFormField(
                        controller: controllerDescription,
                        validator: (value) => value == ''? 'Jangan Kosong':null,
                        decoration: InputDecoration(
                          helperText: ' ',
                          border: OutlineInputBorder(),
                          labelText: "Enter Description...",
                          prefixIcon: Icon(Icons.description_outlined, size: 20,),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffECECEC)
                              )
                          ),
                          labelStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextFormField(
                        controller: controllerLuasLahan,
                        validator: (value) => value == ''? 'Jangan Kosong':null,
                        decoration: InputDecoration(
                          helperText: ' ',
                          border: OutlineInputBorder(),
                          labelText: "Masukan Luas Lahan Satuan M²...",
                          prefixIcon: Icon(Icons.gas_meter_rounded, size: 20,),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffECECEC)
                              )
                          ),
                          labelStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.78,
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.675,
                              height: MediaQuery.of(context).size.height * 0.06,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffECECEC),
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Select Map..",
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                            width: 10, // Sesuaikan jarak antara TextFormField dan tombol dengan kebutuhan
                          ),
                          SizedBox(
                            width: 40, // Sesuaikan ukuran ikon dengan kebutuhan
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff408CFF),
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TambahMapFarmer(id: widget.id),
                                  ),
                                );
                              },
                              child: Icon(Icons.map_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Status Panen",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff545454)
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xffECECEC),
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownValue,
                          items: status.map((String status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(status, style: TextStyle(
                                color: Color(0xff545454),
                                fontSize: 13,
                              ),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffECECEC),
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('${tanggal.year}/${tanggal.month}/${tanggal.day}')],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Color(0xff408CFF),
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
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff408CFF),
                        ),
                        child: const Text('Tambah Lahan'),
                        onPressed: () {
                          EventDB.addLahan(controllerName.text, controllerDescription.text, widget.coordinate, dropdownValue, controllerTanggal, widget.id , controllerLuasLahan.text);
                          controllerName.clear();
                          controllerDescription.clear();
                          controllerMaps.clear();
                          controllerLuasLahan.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
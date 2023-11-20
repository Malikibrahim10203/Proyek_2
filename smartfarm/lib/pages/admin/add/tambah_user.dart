import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/manage_users.dart';

class TambahUser extends StatefulWidget {
  const TambahUser({Key? key}) : super(key: key);

  @override
  State<TambahUser> createState() => _TambahUserState();
}

class _TambahUserState extends State<TambahUser> {

  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerRole = TextEditingController();
  var formKey         = GlobalKey<FormState>();

  var role = ["admin", "farmer"];
  var dropdownValue = "admin";

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
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ManageUser(info: 0,)));
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
                  height: MediaQuery.of(context).size.height * 0.7,
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
                                  labelText: "Enter your Name...",
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "E-Mail",
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
                                controller: controllerEmail,
                                validator: (value) => value == ''? 'Jangan Kosong':null,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: OutlineInputBorder(),
                                  labelText: "Enter your E-Mail...",
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Password",
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
                                obscureText: true,
                                controller: controllerPassword,
                                validator: (value) => value == ''? 'Jangan Kosong':null,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: OutlineInputBorder(),
                                  labelText: "Enter your Password...",
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Role",
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
                                child: DropdownButton(
                                  value: dropdownValue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: role.map((String role) {
                                    return DropdownMenuItem(
                                      value: role,
                                      child: Text(role),
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
                              width: MediaQuery.of(context).size.width*0.59,
                              child: ElevatedButton(
                                child: const Text('Tambah Data'),
                                onPressed: () {
                                  EventDB.addUser(controllerName.text, controllerEmail.text, controllerPassword.text, dropdownValue);
                                  controllerName.clear();
                                  controllerEmail.clear();
                                  controllerPassword.clear();
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

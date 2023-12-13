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
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Color(0xff545454)
          ),
          title: Text("Add User")
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
                        labelText: "Enter your Name...",
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
                      controller: controllerEmail,
                      validator: (value) => value == ''? 'Jangan Kosong':null,
                      decoration: InputDecoration(
                        helperText: ' ',
                        border: OutlineInputBorder(),
                        labelText: "Enter your E-Mail...",
                        prefixIcon: Icon(Icons.email_outlined, size: 20,),
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
                      obscureText: true,
                      controller: controllerPassword,
                      validator: (value) => value == ''? 'Jangan Kosong':null,
                      decoration: InputDecoration(
                        helperText: ' ',
                        border: OutlineInputBorder(),
                        labelText: "Enter your Password...",
                        prefixIcon: Icon(Icons.lock_open_outlined, size: 20,),
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
                      width: MediaQuery.of(context).size.width * 0.2,
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
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: const Text('Add User'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff408CFF)
                      ),
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
    );
  }
}

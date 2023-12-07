import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/manage_users.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key, required this.id, required this.name, required this.email});
  final id;
  final String? name;
  final String? email;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  String? name;
  String? email;

  var controllerName;
  var controllerEmail;
  var controllerPassword;
  var formKey         = GlobalKey<FormState>();

  var role = ["admin", "farmer"];
  var dropdownValue = "admin";

  List<User> listUser = [];
  void getUser() async {

    listUser = await EventDB.getDetailUser(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    name = widget.name;
    email = widget.email;

    controllerName = TextEditingController(text: name);
    controllerEmail = TextEditingController(text: email);
    controllerPassword = TextEditingController(text: '');
    getUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(color: Colors.black),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Color(0xff545454)
          ),
          title: Text("Edit User")
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, top: 50, right: MediaQuery.of(context).size.width * 0.1),
          child: Expanded(
            child: ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                User user = listUser[index];
                index -= 1;
                return Container(
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
                            maxLines: 1,
                            controller: controllerPassword,
                            validator: (value) => value == ''? 'Jangan Kosong': null,
                            decoration: InputDecoration(
                              helperText: ' ',
                              isDense: true,
                              border: OutlineInputBorder(),
                              labelText: "Enter your Password...",
                              prefixIcon: Icon(Icons.lock_open_outlined, size: 20,),
                              contentPadding: const EdgeInsets.all(0.0),
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
                            child: const Text('Edit User'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff408CFF)
                            ),
                            onPressed: () {
                              if (controllerPassword.text == '') {
                                EventDB.editUser(widget.id??'', controllerName.text, controllerEmail.text, 'null', dropdownValue);
                              } else {
                                EventDB.editUser(widget.id??'', controllerName.text, controllerEmail.text, controllerPassword.text, dropdownValue);
                              }
                              controllerName.clear();
                              controllerEmail.clear();
                              controllerPassword.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

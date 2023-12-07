import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/resource/theme.dart';


class Login extends StatelessWidget {

  var controllerEmail = TextEditingController();
  var controllerPass  = TextEditingController();
  var formKey         = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: greyColor,
        body: ListView(
          children: [Container(
            child: Column(
              children: [
                SizedBox(
                  height: 163,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      size: 25,
                    ),
                    SizedBox(
                      width: 19,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 289,
                  height: 280,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "E-mail Address",
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
                                        labelText: "Enter your email...",
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
                                      controller: controllerPass,
                                      validator: (value) => value == ''? 'Jangan Kosong':null,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Enter your password...",
                                        labelStyle: TextStyle(
                                          fontSize: 10,
                                        ),
                                        helperText: ' ',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Image.asset("assets/img/Logo.png", width: 87, height: 15,),
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff408CFF),

                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        EventDB.login(controllerEmail.text, controllerPass.text);
                                        controllerEmail.clear();
                                        controllerPass.clear();
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 12
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )],
        ),
      ),
    );
  }
}

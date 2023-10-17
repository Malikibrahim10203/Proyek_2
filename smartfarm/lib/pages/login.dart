import 'package:flutter/material.dart';
import 'package:smartfarm/resource/theme.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: greyColor,
        body: Container(
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
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 289,
                height: 264,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
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
                      height: 37,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your email...",
                          labelStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
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
                      height: 37,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your password...",
                          labelStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Image.asset("assets/img/Logo.png", width: 87, height: 15,),
                        TextButton(
                          style: TextButton.styleFrom(backgroundColor: purpleColor),
                          onPressed: () {},
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

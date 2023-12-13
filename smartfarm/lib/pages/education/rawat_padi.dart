import 'package:flutter/material.dart';

class RawatPadi extends StatefulWidget {
  const RawatPadi({Key? key}) : super(key: key);

  @override
  State<RawatPadi> createState() => _RawatPadiState();
}

class _RawatPadiState extends State<RawatPadi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(color: Color(0xff545454)),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Color(0xff545454)
          ),
          title: Text("Rawat Padi"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("assets/img/banner1.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Basic Merawat Padi",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff545454)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color(0xff545454)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

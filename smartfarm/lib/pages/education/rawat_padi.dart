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
                height: MediaQuery.of(context).size.height * 0.3,
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
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40, // Sesuaikan ukuran ikon dengan kebutuhan
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  color: Colors.green,
                                ),
                                child: Icon(Icons.water, color: Colors.white,),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffECECEC),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Penyiraman",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40, // Sesuaikan ukuran ikon dengan kebutuhan
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  color: Colors.green,
                                ),
                                child: Icon(Icons.shopping_bag, color: Colors.white,),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffECECEC),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Pemupukan",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40, // Sesuaikan ukuran ikon dengan kebutuhan
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  color: Colors.green,
                                ),
                                child: Icon(Icons.cut, color: Colors.white,),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffECECEC),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Pemotongan",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40, // Sesuaikan ukuran ikon dengan kebutuhan
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  color: Colors.green,
                                ),
                                child: Icon(Icons.perm_device_info, color: Colors.white,),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffECECEC),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Pemantauan",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}

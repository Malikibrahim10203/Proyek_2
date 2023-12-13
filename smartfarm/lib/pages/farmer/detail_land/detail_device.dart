import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/pages/mqtt/mqtt_handler.dart';

class DetailDevice extends StatefulWidget {

  const DetailDevice({super.key, required this.id});

  final String id;

  @override
  State<DetailDevice> createState() => _DetailDeviceState();
}

class _DetailDeviceState extends State<DetailDevice> {

  MqttHandler mqttHandler = MqttHandler();

  List<Device> listDevice = [];
  void getDevice() async {
    listDevice = await EventDB.getDetailDevice(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    mqttHandler.connect(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sensor Device",
          style: TextStyle(color: Color(0xff545454)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(color: Color(0xff545454)),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/kelembaban_tanah.png",
                                  width: 20),
                            ),
                            title: Text(
                              "Kelembaban Tanah",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length == null) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[0]} %',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xffD6D3D3),
                                            width: 1))),
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/img/temprature.png",
                                  width: 20,
                                )),
                            title: Text(
                              "Temprature",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 2) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[1]} °C',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/humidity.png",
                                  width: 20),
                            ),
                            title: Text(
                              "Condutivity",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 2) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[2]} uS/cm',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/ph_tanah.png",
                                  width: 20),
                            ),
                            title: Text(
                              "pH",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 3) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[3]}',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/nitrogen.png",
                                  width: 20),
                            ),
                            title: Text(
                              "Nitrogen",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 7) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[4]} mg/L',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/phosporus.png",
                                  width: 20),
                            ),
                            title: Text(
                              "Phosphor",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 7) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[5]} mg/L',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xffD6D3D3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffD6D3D3),
                                          width: 1))),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                  "assets/img/kalium.png",
                                  width: 20),
                            ),
                            title: Text(
                              "Kalium",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: ValueListenableBuilder<String>(
                              builder: (BuildContext context,
                                  String value, Widget? child) {
                                List<String> temprature =
                                value.split('#');
                                if (temprature.length < 7) {
                                  return Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      lottie.Lottie.asset(
                                          "assets/animation/loading.json",
                                          height: 50)
                                    ],
                                  );
                                } else {
                                  return Text('${temprature[6]} mg/L',
                                      style: TextStyle(fontSize: 12));
                                }
                              },
                              valueListenable: mqttHandler.data,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/landfarmer.dart';
import 'package:intl/intl.dart';


class Detail extends StatefulWidget {
  const Detail({super.key, required this.todo});

  final String todo;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {


  String? parameter;

  List<Land> listLand = [];



  @override
  void initState() {
    // TODO: implement initState
    parameter = widget.todo;
    getLand();
    super.initState();
  }


  void getLand() async {
    listLand = await EventDB.getDetailLand(parameter??'');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top:50, right: 30 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>LandFarmer()));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                  ),

                ), //pembuatan tombol akhir
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                ),
                Text("Lands Farmer"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.black54,
                    child: Text("Maps"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 75,
              child: Expanded(
                child: ListView.builder(
                  itemCount: listLand.length,
                  itemBuilder: (context, index) {
                    Land land = listLand[index];
                    return ListTile(
                      title: Text(
                        land.name??'',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 110,
              child: Expanded(
                child: ListView.builder(
                  itemCount: listLand.length,
                  itemBuilder: (context, index) {
                    Land land = listLand[index];
                    return SizedBox(
                      height: 85,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0xffD5D5D5),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            "Deskripsi",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            land.description??'',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 120,
              child: Expanded(
                child: ListView.builder(
                  itemCount: listLand.length,
                  itemBuilder: (context, index) {
                    Land land = listLand[index];
                    DateTime datePlanted = DateTime.parse("${land.cropPlantedAt}");
                    DateTime dateNow = DateTime.now();
                    Duration diff = datePlanted.difference(dateNow);
                    return SizedBox(
                      height: 90,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0xffD5D5D5),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            "Usia Tanaman",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '${diff.inDays.toString()} hari',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

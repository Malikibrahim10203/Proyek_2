import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartfarm/pages/admin/detail_land/overview.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';
import 'package:smartfarm/pages/farmer/detail_land/overview_farmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/event/event_db.dart';

class LandFarmer extends StatefulWidget {
  const LandFarmer({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<LandFarmer> createState() => _LandFarmerState();
}

class _LandFarmerState extends State<LandFarmer> {

  List<Land> listLand = [];
  void getDetailLand() async {
    listLand = await EventDB.getDetailLandbyUser(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    getDetailLand();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
      body: Container(
        padding: EdgeInsets.only(left: 30, top:50, right: 30 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton( 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>DashboardFarmer()));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                  ),

                ),//pembuatan tombol akhir
                Text("Lands Farmer"),
                OutlinedButton(
                  onPressed:(){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "+ tambah lahan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54
                    ),

                  ),

                ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: listLand.length,
                itemBuilder: (context, index) {
                  Land land = listLand[index];
                  return SizedBox(
                    height: 100,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListTile(
                              leading:
                              Icon(
                                Icons.image,
                                size: 55,
                              ),
                              title: Text(land.name??''),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewFarmer(id: land.id??'')));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
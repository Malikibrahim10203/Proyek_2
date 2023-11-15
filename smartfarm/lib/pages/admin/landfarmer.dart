import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/detail_device/detail.dart';

class LandFarmer extends StatefulWidget {
  

  @override
  State<LandFarmer> createState() => _LandFarmerState();
}

class _LandFarmerState extends State<LandFarmer> {

  List<Land> listLand = [];
  void getLand() async {
    listLand = await EventDB.getLand();
    setState(() {});
  }

  @override
  void initState() {
    getLand();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top:50, right: 30 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton( 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>DashboardAdmin()));
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
                    style:
                    TextStyle(
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail()));
                    },
                    child: SizedBox(
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
                               ),
                             ],
                           ),
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
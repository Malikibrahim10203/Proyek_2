import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';

class LandFarmer extends StatefulWidget {
  

  @override
  State<LandFarmer> createState() => _LandFarmerState();
}

class _LandFarmerState extends State<LandFarmer> {
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
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54
                    ),

                  ),

                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
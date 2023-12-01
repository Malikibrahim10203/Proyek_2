import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'pages/login.dart';

void main() {
  runApp(SmartFarm());
}

class SmartFarm extends StatelessWidget {
  const SmartFarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        future: EventPref.getUser(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          return snapshot.data == null?
          Login(): snapshot.data!.role=='admin'?
          DashboardAdmin(): DashboardFarmer();
        },
      ),
    );
  }
}



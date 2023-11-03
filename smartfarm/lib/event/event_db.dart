import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smartfarm/config/api.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/farmer/dashboard_farmer.dart';
import 'package:smartfarm/widget/info.dart';

class EventDB {
  static Future<User?> login(String email, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'email': email,
        'password' : pass,
      });

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          user = User.fromJson(responseBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              user!.role == 'admin'?
                  DashboardAdmin():
                  DashboardFarmer()
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
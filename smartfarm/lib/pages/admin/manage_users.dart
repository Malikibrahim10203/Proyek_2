import 'package:flutter/material.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton( // Awal Pembuatan Tombol Kembali
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardAdmin()));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                  ),
                ), // Akhir Pembuatan Tombol Kembali
                Text("Manage User"), // Tulisan
                OutlinedButton( // Awal Pembuatan tombol
                  onPressed: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      "+ Tambah Lahan",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                      ),
                    ),
                  ),
                ), // Akhir Pembuatan Tombol
              ],
            )
          ],
        ),
      ),
    );
  }
}

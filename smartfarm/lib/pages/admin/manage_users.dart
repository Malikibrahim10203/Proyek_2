import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';


class ManageUser extends StatefulWidget {

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {

  List<User> listUser = [];
  void getUser() async {
    listUser = await EventDB.getUser();
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }

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
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: listUser.length,
                itemBuilder: (context, index) {
                  User user = listUser[index];
                  if (index == 0){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          Text(
                            "Aksi",
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  index -= 1;
                  return ListTile(
                    leading: Text('${index+1}'),
                    title: Text(user.email??''),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert),
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
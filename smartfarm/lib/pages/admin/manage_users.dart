import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/add/tambah_user.dart';
import 'package:smartfarm/pages/admin/edit/edit_user.dart';


class ManageUser extends StatefulWidget {
  const ManageUser({super.key, required this.info});
  final info;

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

  void information() {
    if(1 == 1){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: EdgeInsets.all(15),
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text("Data Berhasil ditambahkan"),
          ),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F8),
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
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahUser()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      "+ Tambah User",
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
                  index -= 1;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.manage_accounts_rounded),
                      title: Text("Account"),
                      subtitle: Text(
                        user.email??'',
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUser(id: user.id, name: user.name, email: user.email)));
                            },
                            icon: Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () async {
                              if(
                                await confirm(
                                  context,
                                  title: Text("Alert!"),
                                  content: Text("Apakah anda ingin hapus?"),
                                  textOK: Text("Ya"),
                                  textCancel: Text("Tidak"),
                                )
                              ) {
                                EventDB.deleteUser(user.id??'');
                              }
                              return print('pressedNo');
                            },
                            icon: Icon(Icons.delete, color: Colors.red,),
                          ),
                        ],
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

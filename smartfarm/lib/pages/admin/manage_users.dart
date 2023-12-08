import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/dashboard_admin.dart';
import 'package:smartfarm/pages/admin/add/tambah_user.dart';
import 'package:smartfarm/pages/admin/edit/edit_user.dart';


class ManageUser extends StatefulWidget {

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser>  with SingleTickerProviderStateMixin{

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
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        titleTextStyle: TextStyle(color: Color(0xff545454)),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff545454)
        ),
        title: Text("Manage User")
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 10, right: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listUser.length,
                itemBuilder: (context, index) {
                  User user = listUser[index];
                  index -= 1;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.manage_accounts_rounded, size: MediaQuery.of(context).size.width * 0.1,color: Color(0xff408CFF),),
                      title: Text("Account"),
                      subtitle: Text(
                        user.email??'',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUser(id: user.id, name: user.name, email: user.email,)));
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
                              return print('pressed');
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

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahUser()));
          },
          child: Icon(Icons.add),
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: Color(0xffCCCCCC), width: 2)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  onPressed: () { },
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.manage_accounts_outlined,
                    ),
                    onPressed: () {

                    },
                  ),
                  label: 'Manage Account'
              ),
            ],
          ),
        )
    );
  }
}

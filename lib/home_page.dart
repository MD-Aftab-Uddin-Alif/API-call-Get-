import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapi_call/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Center(child: Text("Get API calling",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.brown,
        ),
        )),
      ),
      body: SafeArea(
        child: userProvider.isLoading==true
        ?Center(child: CircularProgressIndicator(),
        )
        :ListView.builder(itemBuilder:
            (context, itemIndex){
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: Text(userProvider.allUserList[itemIndex].id.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              )),
              title: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(userProvider.allUserList[itemIndex].name.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ))),
              subtitle: Column(
                children: [
                  SizedBox(height: 2,),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text(userProvider.allUserList[itemIndex].email.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))),
                  SizedBox(height: 2,),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text(userProvider.allUserList[itemIndex].phone.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))),
                ],
              ),
            ),
          );
        },
          itemCount: userProvider.allUserList.length,
        ),
      ),
    );
  }
}

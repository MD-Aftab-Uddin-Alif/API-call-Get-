import 'package:flutter/material.dart';
import 'package:getapi_call/Provider/user_provider.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Center(child: Text("Get API calling")),
      ),
      body: SafeArea(
        child: userProvider.isLoading==true
        ?Center(child: CircularProgressIndicator(),
        )
        :ListView.builder(itemBuilder:
            (context, itemIndex){
          return ListTile(
            leading: Text(userProvider.allUserList[itemIndex].id.toString()),
            title: Text(userProvider.allUserList[itemIndex].name.toString()),
            subtitle: Text(userProvider.allUserList[itemIndex].email.toString()),
          );
        },
          itemCount: userProvider.allUserList.length,
        ),
      ),
    );
  }
}

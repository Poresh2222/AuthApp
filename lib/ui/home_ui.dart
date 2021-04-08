import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waterproject_v3/models/user_model.dart';
import 'package:waterproject_v3/ui/components/components.dart';
import 'package:waterproject_v3/services/services.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool _loading = true;
  String _uid = '12345';
  String _name = 'test';
  String _email = 'test';
  String _admin = 'test';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    //var user = Provider.of<UserModel>(context);
    //if (user != null) {
    //  setState(() {
    //    _loading = false;
    //    _uid = user.uid;
    //    _name = user.name;
    //    _email = user.email;
    //  });
    //}

    //_isUserAdmin();

    return Scaffold(
      appBar: AppBar(
        title: Text('WaterLife'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              })
        ],
      ),
      body: LoadingScreen(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 120),
              //Avatar(user),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormVerticalSpace(),
                  Text('uid : ' + _uid, style: TextStyle(fontSize: 16)),
                  FormVerticalSpace(),
                  Text('name : ' + _name, style: TextStyle(fontSize: 16)),
                  FormVerticalSpace(),
                  Text('email : ' + _email, style: TextStyle(fontSize: 16)),
                  FormVerticalSpace(),
                  Text('admin : ' + _admin, style: TextStyle(fontSize: 16)),
                ],
              )
            ],
          ),
        ),
        inAsyncCall: _loading,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  //_isUserAdmin() async {}
}

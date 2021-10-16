import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/log_in_screen.dart';
class LogOutScreen extends StatelessWidget {
  static const routeName='logout-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FlatButton(
                color: Colors.red,
                onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, LogInScreen.routeName);

            }, child: Text('Sign Out')),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Click Above Button to Log outn the User'),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myown/Screens/SignIn.dart';
 
class HomePage extends StatefulWidget {
  final FirebaseUser user;

 
  HomePage(this.user, {Key key}) : super(key: key);
 
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff00796b) ,
          title: Text("My Firebase App", style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.white,
                onPressed: () {
                   signOut(context);
                })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color(0xff00796b),
                Color(0xff00897b),
                Color(0xff009688),
              ],
            ),
          ),
          
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
          Text("60022628", style: TextStyle(fontSize: 30, color: Colors.white)),
          Text(widget.user.email, style: TextStyle(fontSize: 20,color: Colors.white)),
        ]))));
  }
  
  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/'));
  }
}
 

  
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignIn.dart';
//import 'package:myown/Screens/SignIn.dart';




// class MyLoginPage extends StatefulWidget {
//   MyLoginPage({Key key}) : super(key: key);
 
//   @override
//   _MyLoginPageState createState() => _MyLoginPageState();
// }
class ResetPage extends StatefulWidget {
  ResetPage({Key key}) : super(key: key);
 
  @override
  _ResetPageState createState() => _ResetPageState();
}


class _ResetPageState extends State<ResetPage>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


@override
 void initState() {
    super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Container(
          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff00796b),
                              Color(0xff009688),
                              Color(0xff26a69a),
                            ],
                          ),
                        ),
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("ลืมรหัสผ่าน?",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("กรุณากรอกอีเมลล์สำหรับการตั้งรหัสผ่านใหม่",style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    color: Color(0xFFFFFFFf),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "อีเมลล์ของคุณ",
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red,
                            )
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: (){
                        resetPassword();
                      },
                      padding: EdgeInsets.all(0),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffff5f6d),
                              Color(0xffff5f6d),
                              Color(0xffffc371),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                          child: Text("ยืนยัน",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  
                  SizedBox(height: 30,),
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }
  resetPassword() {
    String email = emailController.text.trim();
    _auth.sendPasswordResetEmail(email: email);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("We send the detail to $email successfully.",
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green[300],
    ));

    // Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => LoginPage()),
    //         ModalRoute.withName('/'));
  }

 }





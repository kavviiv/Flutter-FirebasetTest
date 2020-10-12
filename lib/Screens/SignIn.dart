  
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myown/Screens/ResetPassword.dart';
import 'HomePage.dart';
import 'SignUp.dart';


// class MyLoginPage extends StatefulWidget {
//   MyLoginPage({Key key}) : super(key: key);
 
//   @override
//   _MyLoginPageState createState() => _MyLoginPageState();
// }
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
 
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool _validate = false;


@override
 void initState() {
    super.initState();
    checkAuth(context);
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
                  SizedBox(height: 100,),
                  Text("60022628",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(height: 6,),
                  Text("Kawin Singhanat",style: TextStyle(fontSize: 40,color: Colors.white),),
                  SizedBox(height: 6,),
                  Text("Firebase Login Assignment",style: TextStyle(fontSize: 20,color: Colors.white),),
                  
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 450.0,
                    color:  Color(0xFFFFFFFf),
                    //height:100.0,
                    child: TextField(
                      controller: emailController,

                      decoration: InputDecoration(
                        
                        labelText: "อีเมลล์",
                        labelStyle: TextStyle(fontSize: 15,color: Colors.grey),
                        errorText:_validate ? 'กรุณากรอกข้อมูล' : null ,

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
          
                  SizedBox(height: 10,),
                  Container(
                    color:  Color(0xFFFFFFFf),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "รหัสผ่าน",
                        labelStyle: TextStyle(fontSize: 20,color: Colors.grey),
                        errorText:_validate ? 'กรุณากรอกข้อมูล' : null ,
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
                  SizedBox(height: 12,),
                  InkWell(
                  
                    child: Align(                 
                      alignment: Alignment.topRight,
                      child: Text("ลืมรหัสผ่าน ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),                          
                    ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ResetPage();
                        }));
                      },
                  ),
                   
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: (){
                     
                           signIn();
                        
                      },
                      padding: EdgeInsets.all(0),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff0277bd),
                              Color(0xff0288d1),
                              Color(0xff039be5),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                          child: Text("เข้าสู่ระบบ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ยังไม่มีบัญชี?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUp();
                        }));
                      },
                      child: Text("สมัครสมาชิก",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  signIn(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
    ).then((user) {
      print("signed in ${user.email}");
      checkAuth(context);  // add here
    }).catchError((error) {
      print(error.message);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }

    Future checkAuth(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      print("Already singed-in with");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(user)));
    }
  }
 }





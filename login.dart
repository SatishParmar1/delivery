import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:delivery/home.dart';
import 'dart:async';
import 'sign.dart';
import 'view.dart';
import 'package:flutter/services.dart';


class Second extends StatefulWidget {
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  void login() {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>homemenu()),
    );
  }





  @override

  void initState() {
    super.initState();
    Firebase.initializeApp();

  }
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

        SingleChildScrollView(
          child: Column(
            children: [
              Column(

                children: [
                  SizedBox(height: 140,),

                  Container(
                      height: 90,
                      width: 300,

                      child: const Text("Welcome,", style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Color(0xFF42A5F5)),),
                    ),

                  Padding(padding:const  EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Container(
                      height: 70,
                      width: 300,
                      child: const Text("Back", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xFF42A5F5),overflow:TextOverflow.ellipsis,),),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:const EdgeInsets.all(5.0),
                child: Center(
                  child: Container(
                    height: 300, // Reduced height
                    width: 400,
                    margin:const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    decoration: const BoxDecoration(
                        color:Color(0xFF42A5F5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [

                        SizedBox(height: 40),
                        Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child:  TextField(
                            controller: _email,
                            style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),

                            cursorColor: Colors.black,
                            decoration: InputDecoration(

                                hintText: ("Enter your Email") ,
                                hintStyle: TextStyle(fontSize:20,),
                                hoverColor: Colors.black,
                                suffixIcon: Icon(Icons.person,size: 30,),
                                suffixIconColor: Colors.black,
                                contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 0)

                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child:  TextField(
                            controller: _password,
                            style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: ("Enter your Password") ,
                                hintStyle: TextStyle(fontSize:20),
                                hoverColor: Colors.black,
                                suffixIcon: Icon(Icons.lock_open,size: 30,),

                                suffixIconColor: Colors.black,
                                contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 0)

                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                              Container(
                                height: 50,
                                width: 120,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child:   ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.blue,
                                    backgroundColor: Colors.white
                                ),onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => signup()));

                                }, child:
                                const  Text("Signup",style: TextStyle(fontSize: 25,color: Colors.black,overflow:TextOverflow.ellipsis,),),
                                ),

                              ),
                            Container(
                                height: 50,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color:Colors.white,

                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child:   ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.blue,
                                    backgroundColor: Colors.white
                                ),onPressed: (){
                                  HapticFeedback.heavyImpact();
                                  if(_email.text=="np7977@gmail.com"&&_password.text=="7977445073"){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => viewall()));
                                  }else {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text).then((value) {
                                      Navigator.pop(context, MaterialPageRoute(
                                          builder: (context) => homemenu()));
                                      login();
                                    }).onError((error, stackTrace) {
                                      print(error);
                                    });

                                  };
                                  },

                                  child:
                                  const Text("Login",style: TextStyle(fontSize: 25,color: Colors.black,overflow:TextOverflow.ellipsis,),),
                                ),

                              ),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}


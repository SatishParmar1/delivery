import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  void initstate(){
    super.initState();
    Firebase.initializeApp();
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _checkpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 140,top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      width: 150,
                      height: 190,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Shreesai.png'),
                            fit: BoxFit.fitWidth,
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _name,style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Your Name',
                      suffixIcon: Icon(Icons.person_2_rounded,size: 30,),
                      suffixIconColor: Colors.grey,

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1,),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2,),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),

                    ),
                  ),
                ),

                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _email,style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Your Email',
                      suffixIcon: Icon(Icons.mail_rounded,size: 30,),
                      suffixIconColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1,),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2,),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _password,style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: ' New Password',
                      suffixIcon: Icon(Icons.password_rounded,size: 30,),
                      suffixIconColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1,),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2,),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _number,style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile Number',
                      suffixIcon: Icon(Icons.call_end_outlined,size: 30,),
                      suffixIconColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1,),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2,),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),

                  ),
                ),

                SizedBox(height: 30,),
                Container(
                    color: Colors.blueAccent,
                    height: 50,
                    width: 140,
              child:  ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent
                ),onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text).then((value){
                    Fluttertoast.showToast(
                        msg: "SignUp",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        fontSize: 20.0
                    );
                  }).
                  onError((error, stackTrace){
                    print(error);
                  });
                },
                  child:Text("Signup",style: TextStyle(fontSize: 25,height: 1,overflow:TextOverflow.ellipsis,),),

            )
                ),
                SizedBox(height: 20,),
                Text("OR",style: TextStyle(fontSize: 25,overflow:TextOverflow.ellipsis,),),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?",style: TextStyle(fontSize: 15,overflow:TextOverflow.ellipsis),),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child:  Text("Login",style: TextStyle(fontSize: 19,overflow:TextOverflow.ellipsis,),))

                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
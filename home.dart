import 'package:delivery/service/database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:random_string/random_string.dart';
import 'login.dart';
import 'package:text_area/text_area.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';


class homemenu extends StatefulWidget {
  const homemenu({super.key});

  @override


  State<homemenu> createState() => _homemenuState();
}

class _homemenuState extends State<homemenu> {
int index=0;
  int currentPageIndex = 0;
  var reasonValidation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController myTextController = TextEditingController();

 late String imageurl;
late String imageurl2;
late String imageurl1;
late String imageurl3;
late String imageurl4;
late String imageurl5;
late String imageurl6;
late String imageurl7;
final storage = FirebaseStorage.instance;

  @override


    void initState() {
      super.initState();
      myTextController.addListener(() {
        setState(() {
          reasonValidation = myTextController.text.isEmpty;
        });});
      imageurl='';
      imageurl1='';
      imageurl2='';
      imageurl3='';
      imageurl4='';
      imageurl5='';
      imageurl6='';
      imageurl7='';
      getImageUrl();
      other();
    }

void other(){
  if(imageurl4 == ( )){
    for(int i=1;i<=10;i++) {
      print("imageurl4");
    }
  }else {
    for(int i=1;i<=10;i++) {
      print(imageurl4);
    }
  }
}

    Future<void> getImageUrl()async{
      final ref = storage.ref().child('delivery.jpg');
      final ref1 = storage.ref().child('delivery1.jpg');
      final ref2 = storage.ref().child('delivery2.jpg');
      final ref3 = storage.ref().child('popular.jpg');
      final ref4 = storage.ref().child('popular1.jpg');
      final ref5 = storage.ref().child('popular2.jpg');
      final ref6 = storage.ref().child('popular3.jpg');
      final ref7 = storage.ref().child('Shreesai.png');

      final url = await ref.getDownloadURL();
      final url1 = await ref1.getDownloadURL();
      final url2 = await ref2.getDownloadURL();
      final url3 = await ref3.getDownloadURL();
      final url4 = await ref4.getDownloadURL();
      final url5 = await ref5.getDownloadURL();
      final url6 = await ref6.getDownloadURL();
      final url7 = await ref7.getDownloadURL();
      setState(() {
        imageurl= url;
        imageurl1= url1;
        imageurl2= url2;
        imageurl3= url3;
        imageurl4= url4;
        imageurl5= url5;
        imageurl6= url6;
        imageurl7= url7;



      });
    }

Widget build(BuildContext context) {
  final ThemeData theme = Theme.of(context);

    void clear(){
      _name.clear();
      _number.clear();
      _address.clear();
      myTextController.clear();
    }


    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 50,
        elevation: 10,

        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFF42A5F5),
        selectedIndex: currentPageIndex,
        destinations:const <Widget>[

          NavigationDestination(
            selectedIcon: Icon(Icons.home,color: Colors.black,size: 35,),
            icon: Icon(Icons.home_outlined,),
            label: 'Home',

          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_shopping_cart,color: Colors.black,size: 30,),
            icon: Icon(Icons.add_shopping_cart_outlined,),
            label:'Order',

          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person,color: Colors.black,size: 35,),
            icon: Icon(Icons.person_outlined,),
            label:'User',

          ),

        ],
      ),



       appBar: AppBar(
          title: Text("Shree Shai Chemist",style:TextStyle(color: Colors.white,fontSize:25),overflow:TextOverflow.ellipsis),
          backgroundColor: Color(0xFF42A5F5),
          actions: <Widget>[

       Container(
           width: 70,
          decoration: BoxDecoration(
          color: Color(0xFF42A5F5),

    ),
           child: IconButton(onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => Second())); HapticFeedback.heavyImpact();},
             icon: Icon(Icons.login_rounded,size: 35,),
           ),
       ),
      ],

        ),

        body:<Widget>[


        SingleChildScrollView(
            child:
                Container(
                  color: Colors.white,
            child:Column(
                children: [

                  Container(
                      width: double.infinity,

                      child: Column(
                          children: [
                            SizedBox(height: 5,),
                            CarouselSlider(
                              items: [
                                Container(
                                  width: double.infinity,
                                  child: Image(image: NetworkImage(imageurl),fit: BoxFit.fitWidth,),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Image(image: NetworkImage(imageurl1),fit: BoxFit.fitWidth,),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Image(image: NetworkImage(imageurl2),fit: BoxFit.fitWidth,),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 250.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 5 / 4,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 600),
                                viewportFraction: 0.95,
                                autoPlayInterval: const Duration(seconds: 10),
                              ),
                            ),
                          ]
                      )
                  ),
                  SizedBox(height: 40,),
                     Container(
                       width: double.infinity,
                       color: Colors.white,
                      child:Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Top Medicine Companies',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            color: Colors.grey[800],
                          ),
                        ),

                       ),
                     ),

                        Container(
                          height: 110,
                     decoration: BoxDecoration(
                     ),
                     child: Padding(padding: EdgeInsets.only(top: 10),

                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
             //1
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                          borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/drreddy.jpg' ),
                                               fit: BoxFit.fill,
                                          )
                                      ),
                                    ),
                                    ],)
                              ),
             //2
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/sun.jpg' ),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                  ],)
                              ),
              //3
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                           boxShadow:[
                                             BoxShadow(
                                               color: Color(0xffDDDDDD),
                                               blurRadius: 10.0,
                                               spreadRadius: 1.0,
                                               offset: Offset(0.0, 0.0),
                                             )
                                          ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/mankind.jpg'),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                    ],)
                              ),
               //4
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/intas.jpg'),
                                              fit: BoxFit.fill
                                              ,
                                            )
                                        ),
                                      ),
                                    ],)
                              ),
               //5
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/gsk.jpg'),
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                 ],)
                              ),
              //6
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/himaliya.jpg'),
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                    ],)
                              ),
               //7
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/bayer.jpg'),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                   ],)
                              ),
                //8
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/ipca.jpg'),
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                     ],)
                              ),

                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/pfizer.jpg'),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                     ],)
                              ),
                //9
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/heterohealthcare.jpg'),
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                     ],)
                              ),
                //
                              Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 70,
                                      margin: EdgeInsets.fromLTRB(13, 11, 13, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Color(0xffDDDDDD),
                                                blurRadius: 10.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(0.0, 0.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage('assets/johnson.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                        ),
                                      ),
                                     ],)
                              ),
                            ],
                          ),
                        ),
                        ),

                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child:Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Popular Products',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.grey[800],
                          ),
                        ),

                      ),
                    ),
                  ),



                  SizedBox(height: 7,),
                   Container(
                     width: double.infinity,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 180,
                           width: 150,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             boxShadow:[
                               BoxShadow(
                                 color: Color(0xffDDDDDD),
                                 blurRadius: 10.0,
                                 spreadRadius: 1.0,
                                 offset: Offset(0.0, 0.0),
                               )
                             ],
                             borderRadius: BorderRadius.circular(20.0),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image(image: NetworkImage(imageurl3),
                                 fit: BoxFit.cover,),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 20),
                           height: 180,
                           width:150,
                           decoration: BoxDecoration(
                            color: Colors.white,
                               boxShadow:[
                                 BoxShadow(
                                   color: Color(0xffDDDDDD),
                                   blurRadius: 10.0,
                                   spreadRadius: 1.0,
                                   offset: Offset(0.0, 0.0),
                                 )
                               ],
                               borderRadius: BorderRadius.circular(20)
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image(image: NetworkImage(imageurl4),
                                 fit: BoxFit.cover,),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow:[
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: NetworkImage(imageurl5),
                                fit: BoxFit.cover,),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 180,
                          width:150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow:[
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: NetworkImage(imageurl6),
                                fit: BoxFit.cover,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

          ],
            ),
        ),


            ),
          SingleChildScrollView(
         child: Container(

            color: Colors.white,
            child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90),

                const Text("Give me Order,", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xFF42A5F5)),),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _name,style: TextStyle(fontSize: 20),

                    decoration: InputDecoration(hintText: 'Your Name',
                      suffixIcon: Icon(Icons.person_outline,size: 25,),
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


                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _number,style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile Number',
                      suffixIcon: Icon(Icons.call_end_outlined,size: 25,),
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

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(controller: _address,style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(hintText: 'Delivery Address',
                      suffixIcon: Icon(Icons.location_on_outlined,size: 25,),
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

                SizedBox(height: 20),
            Text("Write Your Product",style: TextStyle(fontSize: 20,color: Colors.grey[600]),),
                SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(

                children: <Widget>[
                  Form(
                    key: formKey,
                    child: TextArea(

                      suffixIcon:Icons.post_add_outlined,
                      borderRadius: 15,
                      borderColor: Colors.blueAccent,
                      textEditingController: myTextController,
                      validation: reasonValidation,

                    ),
                  ),
                ],
              ),
            ),
                SizedBox(height: 40),
                Container(

                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child:  ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF42A5F5),
                    ),onPressed: ()async{
                      String Id = randomAlphaNumeric(10);
                      Map<String, dynamic>employeeInfMap={
                        "id":Id,
                        "Name":_name.text,
                        "Number":_number.text,
                        "Address":_address.text,
                        "Product":myTextController.text,
                      };
                      await DatabaseMethod().addEmployeeDetails(employeeInfMap, Id).then((value) {
                        Fluttertoast.showToast(
                            msg: "Order Submitted",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 20.0
                        );
                      });
                      clear();
                      },
                      child:Text("Submit",style: TextStyle(fontSize: 25,overflow:TextOverflow.ellipsis,),),

                    )
                ),
                SizedBox(height: 270,)
              ],
            ),
          ),

    ),

          Container(
            child: Column(
              children: [

              ],
            ),
          ),

        ][currentPageIndex],

        );

  }
  }





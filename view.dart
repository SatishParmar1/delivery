import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_area/text_area.dart';

class viewall extends StatefulWidget {
  const viewall({super.key});

  @override
  State<viewall> createState() => _viewallState();
}

class _viewallState extends State<viewall> {
 Stream? EmployeeStream;
 var reasonValidation = true;
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 TextEditingController _name = TextEditingController();
 TextEditingController _number = TextEditingController();
 TextEditingController _address = TextEditingController();
 TextEditingController myTextController = TextEditingController();


 getontheload() async{
   EmployeeStream = await DatabaseMethod().getEmployeeDetails();
   setState(() {

   });
 }
 @override

 void initState(){
   getontheload();
   super.initState();
 }

 Widget allEmployeeDetails(){
   return StreamBuilder(
       stream:EmployeeStream,
       builder: (context,AsyncSnapshot snapshot){
     return snapshot.hasData
         ? ListView.builder(
         itemCount: snapshot.data.docs.length,
         itemBuilder:(context,index){
           DocumentSnapshot ds = snapshot.data.docs[index];


           return   Container(
             margin: EdgeInsets.only(bottom: 20),
             child: Material(
               elevation: 5,
               borderRadius: BorderRadius.circular(10),
               child: Container(
               padding: EdgeInsets.all(20),
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.blue.shade100,borderRadius: BorderRadius.circular(10),

               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [

                       GestureDetector(
                         onTap: (){
                           deleteEmployeeDetail(ds["id"]);

                         },
                           child: Icon(Icons.delete_rounded,size: 25,)),



                       SizedBox(width: 40,),
                       GestureDetector(
                         behavior: HitTestBehavior.deferToChild,
                           onTap: (){
                             _name.text=ds["Name"];
                             _number.text=ds["Number"];
                             _address.text=ds["Address"];
                             myTextController.text=ds["Product"];

                              EditEmployeeDetail(ds["id"]);
                             },
                           child: Icon(Icons.edit,size: 25,)),
                     ],
                   ),
                  Row(
                    children:[
                      Text("Name :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                      Text(ds["Name"],style: TextStyle(fontSize: 20.0),),
                    ],
                  ),
                   Row(
                     children:[
                       Text("Number :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                       Text(ds["Number"],style: TextStyle(fontSize: 20.0),),
                     ],
                   ),
                   Text("Address :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                   Text(ds["Address"],style: TextStyle(fontSize: 20.0),),
                   Text("Product :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                   Text(ds["Product"],style: TextStyle(fontSize: 20.0),),

                 ],
               ),
             ),
             ),
           )
          ;
         }):
     Container();
   });

 }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Order'),
        backgroundColor: Colors.blueAccent,
      ),
      body:  Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetails()),
          ],
        ),
      ),


    );
  }


 // update alert dialog
  Future EditEmployeeDetail(String id)=> showDialog(context: context, builder:(context)=>AlertDialog(
      content: SingleChildScrollView(
      child:Container(
        width: 300,
          child:Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel,size: 29,
                    ),),
                  SizedBox(width: 40,height: 10,),
                  Text("Edit",style:TextStyle(color: Colors.red,fontSize: 30)),
                  Text("Details",style:TextStyle(color: Colors.red,fontSize: 30)),

                ],),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        errorText: 'Please Enter your Product!',
                      ),
                    ),
                  ],
                ),
              ),
SizedBox(height: 20,),
              Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              child:ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent
              ),onPressed: ()async{
                Map<String,dynamic>updateInfo={
                  "Name":_name.text,
                  "Number":_number.text,
                  "Address":_address.text,
                  "Id":id,
                  "Product":myTextController.text,
                };
                await DatabaseMethod().updateEmployeeDetail(id, updateInfo).then((value){
                  Navigator.pop(context);
                });
              } , child:Text("Update",style: TextStyle(fontSize: 30,height: 1,overflow:TextOverflow.ellipsis)),
                ),
              ),
            ],
          )
      ),
  ),
  ));


  // Delete alert dialog
   Future deleteEmployeeDetail(String id)=> showDialog(context: context, builder:(context)=>AlertDialog(
   content: Container(
  width: 300,
   height: 140,
   child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
   children: [
   SizedBox(width: 40,height: 10,),
   Text("Delete Alert",style:TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),
     SizedBox(width: 20),
     Text("You really want to delete the order",style:TextStyle(color: Colors.black,fontSize: 15)),

  SizedBox(height: 30,),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [

            Container(
             height: 45,
             width: 90,
             decoration: const BoxDecoration(
               color:Colors.white,

               borderRadius: BorderRadius.all(Radius.circular(10)),
             ),
             child:   ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.blue,
                 backgroundColor: Colors.blueAccent
             ),onPressed: (){
               Navigator.pop(context);
             }, child:
             const  Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.white,overflow:TextOverflow.ellipsis,),),
             ),

           ),


         Container(
           height: 45,
           width: 90,
           decoration: const BoxDecoration(
             color:Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(10)),
           ),
           child:   ElevatedButton(style: ElevatedButton.styleFrom(foregroundColor: Colors.blue,
               backgroundColor: Colors.blueAccent
           ),onPressed: ()async{
             await DatabaseMethod().deleteEmployeeDetail(id).then((value){
               Navigator.pop(context);
             });


           }, child:
           const  Text("Delete",style: TextStyle(fontSize: 20,color: Colors.white,overflow:TextOverflow.ellipsis,),),
           ),

         ),

     ],
   )
   ]
  )
  )
 ));

      }

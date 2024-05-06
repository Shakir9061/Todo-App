import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/login.dart';
import 'package:firebase/screens/page1.dart';
import 'package:flutter/material.dart';

class Regstudent extends StatefulWidget {
  const Regstudent({super.key});

  @override
  State<Regstudent> createState() => _RegstudentState();
}

class _RegstudentState extends State<Regstudent> {
  var name =TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();

  Future<void>sample()async{
    final regreference =await FirebaseFirestore.instance.collection('register').add({
      'name':name.text,
      'email':email.text,
      'password':password.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text('Registration',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 30),
                    child: Text('Name',style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 45,
                  width: 350,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              
               Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Email',style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 45,
                  width: 350,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
               Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Password',style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 45,
                  width: 350,
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: InkWell(
                  onTap: () {
                    sample();
                    name.clear();
                    email.clear();
                    password.clear();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Page1(),));
          
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                    child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),
                ),
              ),
                InkWell(child: Text('Already have an account'),onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          
                  },)
            ],
          ),
        ),
      ),
    );
  }
}
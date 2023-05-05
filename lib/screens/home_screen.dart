import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fiversosaude/reusable_widgets/reusable_widget.dart';
import 'package:fiversosaude/screens/signin_screen.dart';
import 'package:fiversosaude/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FitVerso"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Saiu");
                Navigator.push(context, MaterialPageRoute(builder: 
                  (context) => SignInScreen()));
              });
            },
          )
        ],
      ),
      body: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
            hexStringToColor("007fff"),
            hexStringToColor("007fff"),
            hexStringToColor("007fff")
    ],
    begin: Alignment.topCenter, end: Alignment.bottomCenter
    )),
    child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20,0),
                child: Column(children: [
                  Image.asset(
                    "assets/images/exercicio_logo.png",
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                    color: Colors.white,
                  ),
                  menus(context, true, (){
                    
                  }),
                 Image.asset(
                    "assets/images/imc.jpg",
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                    
                  ),
                  menus(context, false, (){
                    
                  }),
                ])
      )))
      )
    );
  }

  Container menus(
  BuildContext context, bool nome, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          nome ? 'EXERCICIOS' : 'CALCULAR IMC',
          style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if(states.contains(MaterialState.pressed)){
                return Colors.black87;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            )
          ),
        ),
      );
}

} 
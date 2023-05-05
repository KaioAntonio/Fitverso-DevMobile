import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiversosaude/screens/home_screen.dart';
import 'package:fiversosaude/screens/signup_screen.dart';
import 'package:fiversosaude/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
            hexStringToColor("000000"),
            hexStringToColor("3232aa"),
            hexStringToColor("5050ff")
    ],
    begin: Alignment.topCenter, end: Alignment.bottomCenter
    )),
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.2, 20, 0),
        child: Column
        (children: [
         Stack(
            children: [
              logoWidget("assets/images/logo.png"),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "FITVERSO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          reusableTextField("Enter Username", Icons.person_outline,
           false, _emailTextController),
           SizedBox(
            height: 20,
          ),
          reusableTextField("Enter Password", Icons.lock_outline,
           true, _passwordTextController),
           SizedBox(
            height: 20,
          ),
          signInSignUpButton(context, true, (){
  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailTextController.text, password: _passwordTextController.text)
    .then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).onError((error, StackTrace) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro"),
          content: new Text("Informe uma email e senha válidos"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
    });
}),

          signUpOtiopn()
        ]),
      )
    ),
    ));
  }

  Row signUpOtiopn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Não tem uma conta?",
          style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              " Cadastrar",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }

}

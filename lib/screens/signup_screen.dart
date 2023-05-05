import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _IdadeTextController = TextEditingController();
  TextEditingController _PesoTextController = TextEditingController();
  TextEditingController _AlturaTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Cadastrar",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("000000"),
            hexStringToColor("3232aa"),
            hexStringToColor("5050ff")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20,0),
                child: Column(children: [
                   SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Nome", Icons.person_outline,
                  false, _userNameTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Email", Icons.person_outline,
                  false, _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Idade", Icons.person_outline,
                  false, _IdadeTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Peso", Icons.person_outline,
                  false, _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Altura", Icons.person_outline,
                  false, _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Senha", Icons.lock_outline,
                  true, _passwordTextController),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text, 
                      password: _passwordTextController.text).then((value) {
                        print("Conta criada!");
                        Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                  
                  })
                ]),
                ),
        ),
      ),
    );
  }
}
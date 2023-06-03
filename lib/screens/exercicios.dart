import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fiversosaude/reusable_widgets/reusable_widget.dart';
import 'package:fiversosaude/screens/IMCCalculator.dart';
import 'package:fiversosaude/screens/exercicio_abdomen.dart';
import 'package:fiversosaude/screens/exercicio_inferior.dart';
import 'package:fiversosaude/screens/signin_screen.dart';
import 'package:fiversosaude/screens/signup_screen.dart';
import 'package:flutter/material.dart';


import '../utils/color_utils.dart';
import 'exercicio_superior.dart';

class Exercicios extends StatefulWidget {
  const Exercicios({ Key? key }) : super(key: key);

  @override
  State<Exercicios> createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
            hexStringToColor("000000"),
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
        Text(
          'Treinos Disponíveis',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),              
                   SizedBox(height: 20),
                  Image.asset(
                    "assets/images/superior.jpg",
                    fit: BoxFit.fitWidth,
                    width: 300,
                    height: 150,
                  
                  ),
                  menus(context, true, (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ExerciseScreen()));
                  }),
                 Image.asset(
                    "assets/images/abdomen.jpg",
                    fit: BoxFit.fitWidth,
                    width: 300,
                    height: 150,
                    
                  ),

                  localiza(context, true, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseAbdomen()));
                  }),

                  Image.asset(
                    "assets/images/inferior.jpg",
                    fit: BoxFit.fitWidth,
                    width: 300,
                    height: 150,
                    
                  ),

                  menus(context, false, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseInferiorScreen()));
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
          nome ? 'Treino de Superiores' : 'Treino de Inferiores',
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

Container localiza(
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
          nome ? 'Treino de Abdômen' : 'CALCULAR IMC',
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
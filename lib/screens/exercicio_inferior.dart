import 'dart:async';

import 'package:fiversosaude/screens/IMCCalculator.dart';
import 'package:fiversosaude/screens/exercicio_tempo.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ExerciseInferiorScreen extends StatefulWidget {
  @override
  _ExerciseInferiorScreen createState() => _ExerciseInferiorScreen();
}

class _ExerciseInferiorScreen extends State<ExerciseInferiorScreen> {
  bool isTimerRunning = false;
  int exerciseDuration = 30; // Duração do exercício em segundos
  int currentDuration = 0;

  bool isFlexaoConcluido = false;
   int flexaoComElasticoDuracao = 45;
  bool isFlexaoComElasticoConcluido = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("000000"),
              hexStringToColor("007fff"),
              hexStringToColor("007fff"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Treinos de inferiores', // Nome adicionado
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/agachamento.gif', // Substitua pelo caminho da imagem desejada
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Agachamento',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 5),
                isTimerRunning
                    ? Text(
                        'Tempo restante: ${exerciseDuration - currentDuration} segundos',
                        style: TextStyle(fontSize: 18),
                      )
                    : Container(),
                SizedBox(height: 5),
                 menus(context, false, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseTimerScreen()));
                  }),
                
                Image.asset(
                  'assets/images/agachamento-frontal-com-barra.gif', // Substitua pelo caminho da imagem desejada
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Agachamento frontal com barra',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 5),
                isTimerRunning
                    ? Text(
                        'Tempo restante: ${exerciseDuration - currentDuration} segundos',
                        style: TextStyle(fontSize: 18),
                      )
                    : Container(),
                SizedBox(height: 5),
                menus(context, false, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseTimerScreen()));
                  }),
                Image.asset(
                  'assets/images/barbell-single-leg-deadlift.gif', // Substitua pelo caminho da imagem desejada
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Stiff',
                  style: TextStyle(fontSize:  20, color: Colors.white),
                ),
                SizedBox(height: 5),
                isTimerRunning
                    ? Text(
                        'Tempo restante: ${exerciseDuration - currentDuration} segundos',
                        style: TextStyle(fontSize: 18),
                      )
                    : Container(),
                SizedBox(height: 5),
                menus(context, false, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseTimerScreen()));
                  }),
                Image.asset(
                  'assets/images/panturrilha.gif', // Substitua pelo caminho da imagem desejada
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Panturrilha',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 5),
                isTimerRunning
                    ? Text(
                        'Tempo restante: ${exerciseDuration - currentDuration} segundos',
                        style: TextStyle(fontSize: 18),
                      )
                    : Container(),
                SizedBox(height: 5),
                menus(context, false, (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ExerciseTimerScreen()));
                  }),
              ],
            ),
          ),
        ),
      ),
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
          nome ? 'EXERCICIOS' : 'Fazer Exercicio',
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

  void startExercise(int duration) {
    setState(() {
      isTimerRunning = true;
      exerciseDuration = duration;
      currentDuration = 0;
    });

    // Iniciar temporizador
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (currentDuration < exerciseDuration) {
          currentDuration++;
        } else {
          timer.cancel();
          isTimerRunning = false;
          currentDuration = 0;
        }
      });
    });
  }



  void flexaoComElastico() {
    setState(() {
      isTimerRunning = true;
      isFlexaoComElasticoConcluido = false;
    });

    // Iniciar temporizador
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (currentDuration < flexaoComElasticoDuracao) {
          currentDuration++;
        } else {
          timer.cancel();
          isTimerRunning = false;
          isFlexaoComElasticoConcluido = true;
          currentDuration = 0;
        }
      });
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: ExerciseInferiorScreen(),
  ));
}
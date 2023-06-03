import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ExerciseTimerScreen extends StatefulWidget {
  @override
  _ExerciseTimerScreenState createState() => _ExerciseTimerScreenState();
}

class _ExerciseTimerScreenState extends State<ExerciseTimerScreen> with TickerProviderStateMixin {
  
  AnimationController? _controller;
  Timer? _timer;
  int remainingSeconds = 30;

  @override
  void initState() {
Image.asset(
                    "assets/images/exercicio_logo.png",
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                    color: Colors.white,
                  );
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: remainingSeconds),
    );
    _controller!.reverse(from: 1);

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          showCompletionDialog();
        }
      });
    });
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Parabéns!'),
          content: Text('Exercício concluído!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Voltar para a tela anterior
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade400,
              Colors.blue.shade800,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _controller!,
                builder: (context, child) {
                  return Center(
                    child: LinearProgressIndicator(
                      value: _controller!.value,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                },
              ),
            ),
            Text(
              remainingSeconds.toString(),
              style: TextStyle(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExerciseTimerScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

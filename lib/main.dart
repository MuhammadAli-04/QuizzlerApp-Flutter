import 'package:flutter/material.dart';
import 'quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> record = [];
  QuizBank quizBank = QuizBank();
  int num = 1;

  void pressed(bool answer){
    if(num == 14){
      Alert(
        context: context,
        style: const AlertStyle(
          backgroundColor: Colors.white,
        ),
        type: AlertType.info,
        title: "Quiz Ended",
        desc: "Tap button to reset quiz app",
        buttons: [
          DialogButton(
            onPressed: (){
              setState(() {
                quizBank = QuizBank();
                record = [];
                num = 1;
              });
              Navigator.pop(context);
            },
            color: const Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
            child: const Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
      return;
    }
    setState(() {
      if (quizBank.getAnswer() == answer){
        record.add(const Icon(Icons.check,color: Colors.green,),);
      } else {
        record.add(const Icon(Icons.close,color: Colors.red,));
      }
    });

    num++;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(child: Text("Quizzler")),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "Question:",
                  style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      letterSpacing: 2.0
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                  child: Text(
                    quizBank.nextQuestion(),
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: TextButton(
                    onPressed: (){
                      pressed(true);
                    },
                    child: Container(
                      color: Colors.green[700],
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical:10.0),
                        child:  Center(
                          child: Text(
                            "True",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                    onPressed: (){
                      pressed(false);
                    },
                    child: Container(
                      color: Colors.red[700],
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical:10.0),
                        child:  Center(
                          child: Text(
                            "False",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: record,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

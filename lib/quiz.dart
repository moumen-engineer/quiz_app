import 'package:flutter/material.dart';
import 'appbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain appbrain = Appbrain();  //variable appbrain de type enregistrement Appbrain ;

void main() {
  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Widget> answerresult = [];
  void checkanswer(bool whatuserpicked){
    if (appbrain.getquestionanswer() == whatuserpicked) {
      answerresult.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.thumb_up,color: Colors.green,),
        ),
      );
    } else {
      answerresult.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.thumb_down, color: Colors.red,),
        ),
      );
    }
    if(appbrain.isfinished() == true){
      Alert(
        context: context,
        type: AlertType.error,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      appbrain.reset();  // inistialiser qstnum=0; pour redemarer l'application m debut
      answerresult = [];   //vider tout le contenue de list answerresult
    }else{
      appbrain.nextquestion();
    }
  }
  //############################################################################

  /*List<String> qst = [
    'the speed of a cheetah is 120 km',
    'a person can survive without air for two minutes and thirty seconds',
    'the average sidereal day length for mars is 24 hours and 37 minutes',
    'the summit of Everest is 6848 m',
  ];
  List<String> image = [
    'images/image(0).jpg',
    'images/image(1).jpg',
    'images/image(2).jpg',
    'images/image(3).jpg',
  ];
  List<bool> answers = [
    true,
    false,
    true,
    false,
  ];*/

  //#############################################################################

  /*List <Question> questiongroup = [
    Question(
      q: 'the speed of a cheetah is 120 km',
      i: 'images/image(0).jpg',
      a: true,
    ),
    Question(
      q: 'a person can survive without air for two minutes and thirty seconds',
      i: 'images/image(1).jpg',
      a: false,
    ),
    Question(
      q: 'the average sidereal day length for mars is 24 hours and 37 minutes',
      i: 'images/image(2).jpg',
      a: true,
    ),
    Question(
      q: 'the summit of Everest is 6848 m',
      i: 'images/image(3).jpg',
      a: false,
    ),
  ];*/

  //############################################################################
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          toolbarHeight: 70,
          title: Row(
            children: const [
              Image(
                image: AssetImage('images/nationalgeo.png'),
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //tamdid button true and false
            children: [
              Row(
                children: answerresult,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(appbrain.getquestionimage(),
                            width: 360,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      appbrain.getquestiontext(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkanswer(true);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'true',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkanswer(false);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'false',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

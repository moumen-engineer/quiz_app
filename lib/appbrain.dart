
import 'question.dart';

// enregistrement Appbrain contient autre enregistrement Question ;

class Appbrain{
  int _qstnum = 0;
  final List <Question> _questiongroup = [   // _questiongroup this is encapsulation we can use this variable only on this class
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
    Question(
      q: 'the green tree python lives in australia',
      i: 'images/image(4).jpg',
      a: true,
    ),
  ];

  void nextquestion() {
    if( _qstnum < _questiongroup.length - 1){
      _qstnum++;
    }
  }

  String getquestiontext() {
    return _questiongroup[_qstnum].questionText;
  }
  String getquestionimage() {
    return _questiongroup[_qstnum].questionImage;
  }
  bool getquestionanswer() {
    return _questiongroup[_qstnum].questionAnswer;
  }
  bool isfinished () {
    if(_qstnum >= _questiongroup.length - 1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _qstnum=0;
  }
}




class Question{
  late String _text;
  late bool _answer;

  Question(String text,bool answer){
    _text = text;
    _answer = answer;
  }

  String getQuestion(){
    return _text;
  }

  bool getAnswer(){
    return _answer;
  }
}
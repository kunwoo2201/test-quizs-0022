import 'package:flutter/material.dart';
import 'package:quize_app_test/model/model_quiz.dart';
import 'package:quize_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizes = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Quiz App'),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPQqX1C50-0tntccdF70yWsV2F3BaZm_czEwyGu_mfWsdZBuiiELELZxDDrRAKjWJaRQ&usqp=CAU',
                  width: width * 0.8,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.0010),
              ),
              Text(
                '플러터 퀴즈 앱',
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '퀴즈를 풀기 전 안내사항입니다. \n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.020),
              ),
              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n 다음 문제 버튼을 눌러주세요.'),
              _buildStep(width, '3. 만점을 향해 도전하세요!'),
              Padding(
                padding: EdgeInsets.all(width * 0.005),
              ),
              Container(
                padding: EdgeInsets.only(bottom: width * 0.010),
                child: ButtonTheme(
                  minWidth: width * 0.08,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      "자금 퀴즈 풀기",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                    quizs: quizes,
                                  )));
                    },
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

Widget _buildStep(double width, String title) {
  return Container(
    padding: EdgeInsets.fromLTRB(
      width * 0.048,
      width * 0.024,
      width * 0.048,
      width * 0.048,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.check_box,
          size: width * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.024),
        ),
        Text(title),
      ],
    ),
  );
}

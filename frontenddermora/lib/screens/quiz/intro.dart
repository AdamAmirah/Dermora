import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/quiz/quiz.dart';
import 'package:frontenddermora/screens/quiz/result.dart';
import 'package:frontenddermora/util/styles.dart';

class MainQuiz extends StatefulWidget {
  const MainQuiz({Key? key}) : super(key: key);

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  final _questions = const [
    {
      'questionText': 'Which most closely describes the look of your pores?',
      'answers': [
        {'text': 'Large and visible all over', 'score': -2},
        {'text': 'Medium sized all over', 'score': -2},
        {'text': 'Small, not easily noticed all over.', 'score': 10},
        {
          'text': 'Large or medium sized and only visible in T zone',
          'score': -2
        },
      ],
    },
    {
      'questionText': 'How does your skin look and feel when you wake up?',
      'answers': [
        {'text': 'My skin is screaming for moisture.', 'score': -2},
        {'text': 'My face is oily and shiny all over.', 'score': -2},
        {
          'text': 'My eyes are puffy and my skin feels somewhat dry.',
          'score': -2
        },
        {
          'text': 'My forehead is very oily but my cheeks feel dry.',
          'score': 10
        },
        {
          'text': 'My skin is calm with a light layer of oil all over.',
          'score': 10
        },
        {'text': 'My skin is oily and broken out.', 'score': 10},
      ],
    },
    {
      'questionText': 'What Do You Feel When You Touch Your Skin?',
      'answers': [
        {'text': 'Oily in some places dry in others', 'score': -2},
        {'text': 'Rough and scaly', 'score': 10},
        {'text': 'Healthy and smooth', 'score': -2},
        {'text': 'Slick and greasy', 'score': -2},
      ],
    },
    {
      'questionText': 'How Does Your Skin Feel After You Wash Your Face?',
      'answers': [
        {'text': 'Clean until the oil soon returns', 'score': 10},
        {'text': 'Itchy and a bit dry', 'score': -2},
        {'text': 'Clean, healthy, and even', 'score': -2},
        {'text': 'Clean in the T zone but dry on the cheeks', 'score': -2},
      ],
    },
    {
      'questionText': 'How often do you break out?',
      'answers': [
        {
          'text': 'I never break out.',
          'score': -2,
        },
        {'text': 'I break out constantly and all over my face.', 'score': 10},
        {
          'text':
              'I break out a few times a year due to weather changes or stress.',
          'score': 10
        },
        {'text': 'I never break out.', 'score': 10},
        {
          'text': 'I break out a couple times a month around my T-zone.',
          'score': 10
        },
        {
          'text': 'I break out often around my cheeks and forehead.',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'Do you have visible sun damage?',
      'answers': [
        {
          'text': 'Yes – I have discoloration and sun spots all over my face.',
          'score': -2,
        },
        {
          'text': 'Yes – I have some sun spots around my nose and cheeks.',
          'score': 10
        },
        {'text': 'No – I have no sun damage.', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kSecBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ),
      ), //Padding      )
    );
  }
}

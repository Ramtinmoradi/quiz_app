import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/data/quastion.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int shownQuestionIndex = 0;
  Question? selectedQuestion;
  bool isFinalAnswerSubmited = false;
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.indigo[900],
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'سوال ${shownQuestionIndex + 1} از  ${getQuestionList().length}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    selectedQuestion = getQuestionList()[shownQuestionIndex];
    String questionImage = getQuestionList()[shownQuestionIndex].imageName!;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.0,
          ),
          Image(
            height: 300.0,
            image: AssetImage(
              'images/$questionImage.png',
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            selectedQuestion!.questionTitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          ...List.generate(4, (index) => _getOptionItem(index)),
          if (shownQuestionIndex == getQuestionList().length - 1 &&
              isFinalAnswerSubmited)
            _getResultButtom(context),
        ],
      ),
    );
  }

  Widget _getOptionItem(int index) {
    return ListTile(
      title: Text(
        selectedQuestion!.answerLists![index],
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          correctAnswer++;
        }

        if (shownQuestionIndex == getQuestionList().length - 1) {
          isFinalAnswerSubmited = true;
        }

        setState(() {
          if (shownQuestionIndex < getQuestionList().length - 1) {
            shownQuestionIndex++;
          }
        });
      },
    );
  }

  Widget _getResultButtom(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: Size(200.0, 50.0),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultScreen(correctAnswer: correctAnswer),
          ),
        );
      },
      child: Text(
        'نتیجه آزمون',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

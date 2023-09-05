import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, this.correctAnswer = 0});
  int correctAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text(
          'نتیجه آزمون',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity, height: 50.0),
          Image(
            height: 300.0,
            image: AssetImage('images/cup.png'),
          ),
          SizedBox(height: 40.0),
          Text(
            'پاسخ های درست شما',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40.0),
          Text(
            '$correctAnswer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

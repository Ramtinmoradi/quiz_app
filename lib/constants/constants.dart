import 'package:quiz_app/data/quastion.dart';

List<Question> getQuestionList() {
  var firstQuestion = Question();
  firstQuestion.questionTitle = 'مشهور ترین شعبده‌باز جهان کیست؟';
  firstQuestion.imageName = '1';
  firstQuestion.correctAnswer = 2;
  firstQuestion.answerLists = [
    'امیراحمدادیبی',
    'دیوید کاپرفیلد',
    'هری هودینی',
    'دیوید بلین',
  ];

  var secondQuestion = Question();
  secondQuestion.questionTitle = 'چه کشوری ایستگاه فضایی میر را بنا کرد؟';
  secondQuestion.imageName = '2';
  secondQuestion.correctAnswer = 0;
  secondQuestion.answerLists = [
    '(شوروی سابق)روسیه',
    'آمریکا',
    'چین',
    'هند',
  ];

  return [firstQuestion, secondQuestion];
}

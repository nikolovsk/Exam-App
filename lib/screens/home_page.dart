import 'package:exam_app/widgets/exam_card.dart';
import 'package:flutter/material.dart';
import '../models/exam.dart';

class HomePage extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: "Мобилни платформи и програмирање", dateTime: DateTime(2025, 11, 17, 14, 0), classrooms: ["117"]),
    Exam(subject: "Дистрибуирани системи", dateTime: DateTime(2025, 11, 18, 8, 0), classrooms: ["117"]),
    Exam(subject: "Програмирање на видео игри", dateTime: DateTime(2025, 11, 17, 13, 0), classrooms: ["13", "138", "215", "200a"]),
    Exam(subject: "Менаџмент информациски системи", dateTime: DateTime(2025, 11, 18, 16, 30), classrooms: ["3", "12", "13", "138", "215"]),
    Exam(subject: "Имплементација на софтверски системи со слободен и отворен код", dateTime: DateTime(2025, 11, 19, 16, 0), classrooms: ["13", "138", "215", "200a"]),
    Exam(subject: "Вовед во биоинформатика", dateTime: DateTime(2025, 11, 19, 18, 0), classrooms: ["2"]),
    Exam(subject: "Анализа и дизајн на ИС", dateTime: DateTime(2025, 11, 20, 10, 30), classrooms: ["315", "Б1", "Б2.2"]),
    Exam(subject: "Тестирање на софтвер", dateTime: DateTime(2025, 11, 20, 18, 0), classrooms: ["2", "3"]),
    Exam(subject: "Веб базирани системи", dateTime: DateTime(2025, 11, 20, 18, 0), classrooms: ["13", "138", "117"]),
    Exam(subject: "Вовед во науката за податоци", dateTime: DateTime(2025, 11, 8, 10, 30), classrooms: ["117", "215"]),
    Exam(subject: "Континуирана интеграција и испорака", dateTime: DateTime(2025, 11, 2, 16, 0), classrooms: ["117"]),
    Exam(subject: "Мобилни информациски системи", dateTime: DateTime(2025, 11, 05, 9, 0), classrooms: ["138"]),
  ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(
          "Распоред за испити - 213068",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade600,
        elevation: 6,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(exam: exams[index]);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.amber.shade600,
        child: Text(
          "Вкупно испити: ${exams.length}",
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


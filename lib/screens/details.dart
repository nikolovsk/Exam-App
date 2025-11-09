import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_info_row.dart';

class DetailsPage extends StatelessWidget {
  final Exam exam;

  const DetailsPage({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return "Испитот е завршен";
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      return "$days дена, $hours часа";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFuture = exam.dateTime.isAfter(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(
          "Детали за испит",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade600,
        elevation: 6,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isFuture ? Colors.teal.shade400 : Colors.red.shade400,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              ExamInfoRow(
                icon: Icons.calendar_today,
                text:
                "${exam.dateTime.day.toString().padLeft(2, '0')}.${exam.dateTime.month.toString().padLeft(2, '0')}.${exam.dateTime.year}",
              ),
              ExamInfoRow(
                icon: Icons.access_time,
                text:
                "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
              ),
              ExamInfoRow(
                icon: Icons.location_on,
                text: exam.classrooms.join(", "),
              ),
              const SizedBox(height: 50),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.white,
                        size: 34,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        !isFuture
                            ? "Испитот е завршен"
                            : "Останато време до испит:",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        exam.dateTime.isBefore(DateTime.now())
                            ? ""
                            : getTimeRemaining(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

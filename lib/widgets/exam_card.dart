import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/details.dart';
import 'exam_info_row.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final isFuture = exam.dateTime.isAfter(DateTime.now());

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailsPage(exam: exam)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isFuture ? Colors.greenAccent : Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.subject,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  ExamInfoRow(
                    icon: Icons.calendar_today,
                    text:
                    "${exam.dateTime.day.toString().padLeft(2, '0')}.${exam.dateTime.month.toString().padLeft(2, '0')}.${exam.dateTime.year}",
                    textColor: Colors.white,
                    backgroundColor: Colors.black26,
                  ),
                  ExamInfoRow(
                    icon: Icons.access_time,
                    text:
                    "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                    textColor: Colors.white,
                    backgroundColor: Colors.black26,
                  ),
                  ExamInfoRow(
                    icon: Icons.location_on,
                    text: exam.classrooms.join(", "),
                    textColor: Colors.white,
                    backgroundColor: Colors.black26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

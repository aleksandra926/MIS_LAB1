import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast ? Colors.green.shade50 : Colors.red.shade50,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      child: ListTile(
        onTap: onTap,
        title: Text(
          exam.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.green : Colors.red.shade900,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16, color: Colors.black54),
                const SizedBox(width: 6),
                Text(exam.classrooms.join(', ')),
              ],
            ),
          ],
        ),
        trailing: Icon(
          isPast ? Icons.check_circle : Icons.schedule,
          color: isPast ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}

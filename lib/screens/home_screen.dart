import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _MyExam {
  final Exam exam;
  _MyExam(this.exam);
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Exam> exams = [
    Exam(name: 'Математика 1', dateTime: DateTime(2022, 12, 10, 9, 0), classrooms: ['Lab2', 'Lab3', 'Lab13']),
    Exam(name: 'Програмирање', dateTime: DateTime(2026, 2, 12, 11, 30), classrooms: ['Lab1', 'Lab12']),
    Exam(name: 'Бази на податоци', dateTime: DateTime(2023, 1, 14, 15, 0), classrooms: ['Lab13']),
    Exam(name: 'Оперативни системи', dateTime: DateTime(2025, 4, 17, 12, 0), classrooms: ['Lab2', 'Lab3', 'Lab-200ab', 'Lab-200v']),
    Exam(name: 'Мрежи', dateTime: DateTime(2023, 1, 20, 9, 30), classrooms: ['Lab12', 'Lab13']),
    Exam(name: 'Алгоритми и податочни структури', dateTime: DateTime(2023, 9, 22, 8, 0), classrooms: ['Lab-200v', 'Lab-200ab', 'Lab-215']),
    Exam(name: 'Информациски системи', dateTime: DateTime(2024, 12, 25, 13, 0), classrooms: ['AMF-MF']),
    Exam(name: 'Вештачка интелигенција', dateTime: DateTime(2025, 6, 16, 11, 0), classrooms: ['Lab2', 'Lab3', 'Lab12', 'Lab13']),
    Exam(name: 'Мобилни апликации', dateTime: DateTime(2026, 2, 5, 10, 0), classrooms: ['AMF-MF', '315']),
    Exam(name: 'Компјутерска графика', dateTime: DateTime(2026, 2, 2, 9, 0), classrooms: ['Lab3', 'Lab12', 'Lab13']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223003'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.teal.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.list_alt, color: Colors.teal),
                const SizedBox(width: 8),
                Text(
                  'Вкупно испити: ${exams.length}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

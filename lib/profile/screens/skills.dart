import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  // Dummy list of technical skills with experience
  final List<Map<String, String>> skills = [
    {'name': 'Flutter', 'experience': '3 years'},
    {'name': 'Dart', 'experience': '3 years'},
    {'name': 'JavaScript', 'experience': '2 years'},
    {'name': 'React Native', 'experience': '2 years'},
    {'name': 'Python', 'experience': '3 years'},
    {'name': 'HTML/CSS', 'experience': '4 years'},
    {'name': 'SQL', 'experience': '3 years'},
    {'name': 'Git', 'experience': '3 years'},
  ];

  SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return ListTile(
            title: Text(skill['name'] ?? ''),
            subtitle: Text('Experience: ${skill['experience'] ?? ''}'),
          );
        },
      ),
    );
  }
}

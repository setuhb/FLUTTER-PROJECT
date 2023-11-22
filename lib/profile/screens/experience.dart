import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiences'),
      ),
      body: ListView(
        children: const [
          ExperienceItem(
            company: 'ABC Tech Inc.',
            position: 'Software Engineer',
            duration: 'Jan 2020 - Present',
            description:
                'Worked on developing and maintaining mobile applications for clients. Collaborated with cross-functional teams to deliver high-quality software solutions.',
          ),
          ExperienceItem(
            company: 'XYZ Solutions',
            position: 'Intern',
            duration: 'May 2019 - Dec 2019',
            description:
                'Completed a software development internship where I gained hands-on experience in mobile app development and learned about industry best practices.',
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final String description;

  const ExperienceItem({super.key, 
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              position,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWorkItem(
            title: 'Project 1',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            link: 'https://example.com/project1',
          ),
          const SizedBox(height: 16.0),
          _buildWorkItem(
            title: 'Project 2',
            description:
                'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
            link: 'https://example.com/project2',
          ),
          const SizedBox(height: 16.0),
          _buildWorkItem(
            title: 'Project 3',
            description:
                'Nullam hendrerit, sapien a tincidunt hendrerit, ligula libero elementum justo.',
            link: 'https://example.com/project3',
          ),
        ],
      ),
    );
  }

  Widget _buildWorkItem({required String title, required String description, required String link}) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // handle This
              },
              child: const Text(
                'Learn More',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

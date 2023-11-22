import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<PortfolioItem> portfolioItems = [
      PortfolioItem(
        title: 'Project 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'assets/1.jpg', 
      ),
      PortfolioItem(
        title: 'Project 2',
        description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        imageUrl: 'assets/2.jpg', 
      ),
      PortfolioItem(
        title: 'Project 3',
        description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
        imageUrl: 'assets/3.jpg', 
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: ListView.builder(
        itemCount: portfolioItems.length,
        itemBuilder: (context, index) {
          return PortfolioItemCard(portfolioItem: portfolioItems[index]);
        },
      ),
    );
  }
}

class PortfolioItem {
  final String title;
  final String description;
  final String imageUrl;

  PortfolioItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class PortfolioItemCard extends StatelessWidget {
  final PortfolioItem portfolioItem;

  const PortfolioItemCard({super.key, required this.portfolioItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            portfolioItem.imageUrl,
            fit: BoxFit.cover,
            height: 200.0, // Set the desired image height
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  portfolioItem.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  portfolioItem.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

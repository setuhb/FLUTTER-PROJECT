import 'package:allinoneproject/calculator/CalculatorScreen.dart';
import 'package:allinoneproject/quiz/screens/quiz_screen.dart';
import 'package:allinoneproject/weather/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../screens/about.dart';
import '../screens/experience.dart';
import '../screens/skills.dart';
import '../screens/work.dart';
import '../screens/portfolio.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  _NavigationWrapperState createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AboutScreen(),
    const ExperienceScreen(),
    const PortfolioScreen(),
    SkillsScreen(),
    const WorkScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All In One App"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Open the drawer using the new context from the Builder
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        // Add your drawer content here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/manna.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle drawer item tap for Home`
                Navigator.pop(context);
                // Add your navigation logic here
              },
            ),
                        ListTile(
              leading: Icon(Icons.sunny),
              title: Text('Weather'),
              onTap: () {
                // Handle drawer item tap for Home
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                // Add your navigation logic here
              },
            ),
                                    ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Quiz'),
              onTap: () {
                // Handle drawer item tap for Home
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => QuizScreen()),
                        );
                // Add your navigation logic here
              },
            ),
                                  ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Calculator'),
              onTap: () {
                // Handle drawer item tap for Home
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => CalculatorScreen()),
                        );
                // Add your navigation logic here
              },
            ),
            // Add more drawer items as needed
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: "About",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: "Experience",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.browse_gallery),
              label: "Portfolio",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: "Skills",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: "Work",
              backgroundColor: Colors.lightBlue),
        ],
        onTap: _onTabTapped,
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}

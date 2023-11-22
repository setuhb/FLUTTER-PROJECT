import 'package:allinoneproject/profile/screens/about.dart';
import 'package:allinoneproject/profile/screens/experience.dart';
import 'package:allinoneproject/profile/screens/portfolio.dart';
import 'package:allinoneproject/profile/screens/skills.dart';
import 'package:allinoneproject/profile/screens/work.dart';
import 'package:allinoneproject/profile/wrappers/navigation_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AllInOneApp());
}

class AllInOneApp extends StatelessWidget {
  const AllInOneApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) =>
            const NavigationWrapper(), 
        '/experience': (context) => const ExperienceScreen(), 
        '/about': (context) => const AboutScreen(), 
        '/portfolio': (context) => const PortfolioScreen(), 
        '/work': (context) => const WorkScreen(), 
        '/skills': (context) =>  SkillsScreen(), 
      },
    );
  }
}
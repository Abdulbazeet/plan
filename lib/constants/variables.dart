import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppVariables {
  static Color lightGreen = Color(0xFF0BCC9D);
  static Color darkGreen = Color(0xFF099C77);
  static Color lightPurple = Color(0xFFA79AE8);
  static Color bgColor = Color.fromARGB(255, 224, 223, 223);
  // static Color bgColor =Color(0xFFF8F8F8);

  static List<Map<String, String>> myLists = [
    {
      "title": "Travels Plans",
      "icon": "assets/icons8-airplane-24.png",
      "tasks": "45 Tasks",
    },
    {
      "title": "Study",
      "icon": "assets/icons8-book-24.png",
      "tasks": "12 Tasks",
    },
    {
      "title": "Work Tasks",
      "icon": "assets/icons8-work-24.png",
      "tasks": "3 Tasks",
    },
    {
      "title": "Night Routine",
      "icon": "assets/icons8-crescent-moon-24.png",
      "tasks": "5 Tasks",
    },
    // {"title": "Weekly Goals", "icon": "", "tasks": ""},
    {
      "title": "Health and Fitness",
      "icon": "assets/icons8-woman-lifting-weights-24.png",
      "tasks": "4 Tasks",
    },
    {
      "title": "Budget and Finance",
      "icon": "assets/icons8-bank-24.png",
      "tasks": "2 Tasks",
    },
    {
      "title": "Meal Prep",
      "icon": "assets/icons8-rice-24.png",
      "tasks": "6 Tasks",
    },
  ];
  static List<Map<String, dynamic>> tasksList = [
    {
      'startTime': '9:00 AM',
      'endTime': '5:00 PM',
      'priority': 'high',
      'title': 'Complete Flutter Mobile App',
      'description':
          'Finish the e-commerce mobile application with payment integration and user authentication',
      'type': 'personal',
    },
    {
      'startTime': '10:30 AM',
      'endTime': '12:00 PM',
      'priority': 'medium',
      'title': 'Team Sprint Planning',
      'description':
          'Organize and conduct sprint planning meeting with development team for Q3 roadmap',
      'type': 'shared',
    },
    {
      'startTime': '2:00 PM',
      'endTime': '4:30 PM',
      'priority': 'high',
      'title': 'Client Presentation Preparation',
      'description':
          'Prepare comprehensive project presentation for client meeting including demos and timeline',
      'type': 'personal',
    },
    {
      'startTime': '8:00 AM',
      'endTime': '11:00 AM',
      'priority': 'low',
      'title': 'Code Documentation Review',
      'description':
          'Review and update technical documentation for all modules in the project repository',
      'type': 'shared',
    },
    {
      'startTime': '1:00 PM',
      'endTime': '6:00 PM',
      'priority': 'high',
      'title': 'Database Migration',
      'description':
          'Migrate production database to new server infrastructure with zero downtime',
      'type': 'personal',
    },
    {
      'startTime': '9:30 AM',
      'endTime': '3:00 PM',
      'priority': 'medium',
      'title': 'UI/UX Design Updates',
      'description':
          'Implement new design system components and update existing user interface elements',
      'type': 'shared',
    },
    {
      'startTime': '11:00 AM',
      'endTime': '1:00 PM',
      'priority': 'low',
      'title': 'Team Building Workshop',
      'description':
          'Organize team building activities and workshops to improve collaboration and communication',
      'type': 'shared',
    },
    {
      'startTime': '3:30 PM',
      'endTime': '7:00 PM',
      'priority': 'medium',
      'title': 'API Integration Testing',
      'description':
          'Test all third-party API integrations and ensure proper error handling mechanisms',
      'type': 'personal',
    },
    {
      'startTime': '8:30 AM',
      'endTime': '4:00 PM',
      'priority': 'high',
      'title': 'Security Audit',
      'description':
          'Conduct comprehensive security audit of the application including penetration testing',
      'type': 'shared',
    },
    {
      'startTime': '10:00 AM',
      'endTime': '2:30 PM',
      'priority': 'medium',
      'title': 'Performance Optimization',
      'description':
          'Optimize application performance by reducing load times and improving memory usage',
      'type': 'personal',
    },
    {
      'startTime': '12:30 PM',
      'endTime': '5:30 PM',
      'priority': 'low',
      'title': 'Marketing Campaign Planning',
      'description':
          'Plan and strategize marketing campaign for product launch including social media strategy',
      'type': 'shared',
    },
    {
      'startTime': '7:00 AM',
      'endTime': '3:30 PM',
      'priority': 'high',
      'title': 'Quality Assurance Testing',
      'description':
          'Execute comprehensive QA testing across all platforms and devices for bug identification',
      'type': 'personal',
    },
    {
      'startTime': '2:15 PM',
      'endTime': '6:45 PM',
      'priority': 'medium',
      'title': 'User Training Materials',
      'description':
          'Create comprehensive user manuals and video tutorials for end-user training',
      'type': 'shared',
    },
    {
      'startTime': '9:45 AM',
      'endTime': '1:15 PM',
      'priority': 'low',
      'title': 'Backup System Setup',
      'description':
          'Configure automated backup systems for data protection and disaster recovery',
      'type': 'personal',
    },
    {
      'startTime': '11:30 AM',
      'endTime': '7:30 PM',
      'priority': 'high',
      'title': 'Production Deployment',
      'description':
          'Deploy application to production environment with proper monitoring and rollback plans',
      'type': 'shared',
    },
    {
      'startTime': '8:15 AM',
      'endTime': '12:45 PM',
      'priority': 'medium',
      'title': 'Customer Support Setup',
      'description':
          'Establish customer support processes and train support team on new features',
      'type': 'shared',
    },
    {
      'startTime': '4:00 PM',
      'endTime': '8:00 PM',
      'priority': 'low',
      'title': 'Analytics Implementation',
      'description':
          'Implement analytics tracking for user behavior analysis and performance metrics',
      'type': 'personal',
    },
    {
      'startTime': '1:30 PM',
      'endTime': '5:00 PM',
      'priority': 'high',
      'title': 'Stakeholder Demo',
      'description':
          'Present final product demo to key stakeholders and gather feedback for future iterations',
      'type': 'shared',
    },
    {
      'startTime': '6:00 AM',
      'endTime': '10:00 AM',
      'priority': 'medium',
      'title': 'Post-Launch Monitoring',
      'description':
          'Monitor application performance and user feedback during the first week after launch',
      'type': 'personal',
    },
    {
      'startTime': '3:00 PM',
      'endTime': '6:30 PM',
      'priority': 'low',
      'title': 'Project Retrospective',
      'description':
          'Conduct project retrospective meeting to analyze successes and areas for improvement',
      'type': 'shared',
    },
  ];

  //**
  // priority list
  static List<Map<String, dynamic>> priority = [
    {
      'title': 'Urgent',
      'description': 'Requires immediate action',
      'icon': Icon(Icons.flag, color: Colors.red),
      'text_color': Colors.red,
    },
    {
      'title': 'Medium',
      'description': 'Should be done soon',
      'icon': Icon(Icons.flag, color: Colors.yellow),
      'text_color': Colors.yellow,
    },
    {
      'title': 'Normal',
      'description': 'Regular task, no urgency',
      'icon': Icon(Icons.flag, color: lightGreen),
      'text_color': lightGreen,
    },
  ];
  // ignore: prefer_final_fields
  static List<String> repeatMode = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly",
    "Custom",
  ];

  static List<String> repeatMode2 = ["None", "Day", "Week", "Month", "Year"];
  // */
}

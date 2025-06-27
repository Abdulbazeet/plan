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
  static List<Map<String, dynamic>> taskGroups = [
    {
      'title': 'Mobile App Development',
      'description':
          'Complete the Flutter app for our client with all required features and testing',
      'type': 'ongoing',
      'percentage': 75,
      'date': 'Dec 15, 2024',
      'numberOfTasks': 12,
    },
    {
      'title': 'Website Redesign Project',
      'description':
          'Redesign the company website with modern UI/UX and responsive design',
      'type': 'completed',
      'percentage': 100,
      'date': 'Nov 28, 2024',
      'numberOfTasks': 8,
    },
    {
      'title': 'Marketing Campaign Q1',
      'description':
          'Plan and execute marketing strategy for first quarter including social media and ads',
      'type': 'ongoing',
      'percentage': 45,
      'date': 'Jan 20, 2025',
      'numberOfTasks': 15,
    },
    {
      'title': 'Database Migration',
      'description':
          'Migrate legacy database to new cloud infrastructure with zero downtime',
      'type': 'completed',
      'percentage': 100,
      'date': 'Oct 30, 2024',
      'numberOfTasks': 6,
    },
    {
      'title': 'Employee Training Program',
      'description':
          'Develop comprehensive training modules for new employees across departments',
      'type': 'ongoing',
      'percentage': 30,
      'date': 'Feb 05, 2025',
      'numberOfTasks': 20,
    },
    {
      'title': 'Security Audit',
      'description':
          'Complete security assessment and implement recommended security measures',
      'type': 'ongoing',
      'percentage': 85,
      'date': 'Dec 22, 2024',
      'numberOfTasks': 9,
    },
    {
      'title': 'Product Launch Event',
      'description':
          'Organize and execute product launch event including venue, catering, and presentations',
      'type': 'completed',
      'percentage': 100,
      'date': 'Sep 15, 2024',
      'numberOfTasks': 18,
    },
    {
      'title': 'API Integration',
      'description':
          'Integrate third-party APIs for payment processing and analytics tracking',
      'type': 'ongoing',
      'percentage': 60,
      'date': 'Jan 10, 2025',
      'numberOfTasks': 7,
    },
    {
      'title': 'Content Management System',
      'description':
          'Build custom CMS for blog and news section with admin panel',
      'type': 'completed',
      'percentage': 100,
      'date': 'Aug 25, 2024',
      'numberOfTasks': 14,
    },
    {
      'title': 'User Experience Research',
      'description':
          'Conduct user research and usability testing for mobile application improvements',
      'type': 'ongoing',
      'percentage': 20,
      'date': 'Mar 01, 2025',
      'numberOfTasks': 11,
    },
    {
      'title': 'Cloud Infrastructure Setup',
      'description':
          'Set up scalable cloud infrastructure with monitoring and backup systems',
      'type': 'ongoing',
      'percentage': 90,
      'date': 'Dec 28, 2024',
      'numberOfTasks': 10,
    },
    {
      'title': 'Quality Assurance Testing',
      'description':
          'Comprehensive testing of all application features and bug fixes',
      'type': 'completed',
      'percentage': 100,
      'date': 'Nov 12, 2024',
      'numberOfTasks': 16,
    },
    {
      'title': 'Documentation Update',
      'description':
          'Update all technical documentation and user manuals for latest version',
      'type': 'ongoing',
      'percentage': 40,
      'date': 'Jan 30, 2025',
      'numberOfTasks': 5,
    },
    {
      'title': 'Performance Optimization',
      'description':
          'Optimize application performance and reduce loading times across all modules',
      'type': 'ongoing',
      'percentage': 70,
      'date': 'Feb 15, 2025',
      'numberOfTasks': 8,
    },
    {
      'title': 'Brand Identity Refresh',
      'description':
          'Complete rebrand including logo, colors, typography, and brand guidelines',
      'type': 'completed',
      'percentage': 100,
      'date': 'Jul 20, 2024',
      'numberOfTasks': 13,
    },
  ];

}

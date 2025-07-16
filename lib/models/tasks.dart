// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:plan/common/enums.dart';

class UserTasks {
  final String taskUid;
  final String taskName;
  final String taskDescription;
  final bool isComplete;
  final DateTime taskStartDate;
  final DateTime? taskEndDate;
  final TaskPriority taskPriority;
  final String taskCategory;
  final RepeatMode repeatMode;

  UserTasks({
    required this.taskUid,
    required this.taskName,
    required this.taskDescription,
    required this.isComplete,
    required this.taskStartDate,
    required this.taskEndDate,
    required this.taskPriority,
    required this.taskCategory,
    required this.repeatMode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskUid': taskUid,
      'taskName': taskName,
      'taskDescription': taskDescription,
      'isComplete': isComplete,
      'taskStartDate': taskStartDate.millisecondsSinceEpoch,
      'taskEndDate': taskEndDate?.millisecondsSinceEpoch,
      'taskPriority': taskPriority.name,
      'taskCategory': taskCategory,
      'repeatMode': repeatMode.name,
    };
  }

  factory UserTasks.fromMap(Map<String, dynamic> map) {
    return UserTasks(
      taskUid: map['taskUid'] as String,
      taskName: map['taskName'] as String,
      taskDescription: map['taskDescription'] as String,
      isComplete: map['isComplete'] as bool,
      taskStartDate: DateTime.fromMillisecondsSinceEpoch(
        map['taskStartDate'] as int,
      ),
      taskEndDate:
          map['taskEndDate'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['taskEndDate'] as int)
              : null,
      taskPriority: TaskPriority.values.firstWhere(
        (e) => e.name == map['taskPriority'],
        orElse: () => TaskPriority.high,
      ),
      taskCategory: map['taskCategory'] as String,
      repeatMode: RepeatMode.values.firstWhere(
        (e) => e.name == map['repeatMode'],
        orElse: () => RepeatMode.daily,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTasks.fromJson(String source) =>
      UserTasks.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserList {
  final String listname;
  final String listUid;
  // final List<UserTasks> tasks;

  UserList({
    required this.listname,
    required this.listUid,
    // required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listname': listname,
      'listUid': listUid,
      // 'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory UserList.fromMap(Map<String, dynamic> map) {
    return UserList(
      listname: map['listname'] as String,
      listUid: map['listUid'] as String,

      // tasks: List<UserTasks>.from(
      //   (map['tasks'] as List<dynamic>).map<UserTasks>(
      //     (x) => UserTasks.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserList.fromJson(String source) =>
      UserList.fromMap(json.decode(source) as Map<String, dynamic>);
}

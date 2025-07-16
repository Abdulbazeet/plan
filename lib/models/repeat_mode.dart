// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:plan/common/enums.dart';

class Repeat {
  final int? interval;
  final RepeatMode? mode;
  final List<int>? days;
  Repeat({this.interval, this.mode, this.days});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interval': interval,
      'mode': mode?.name,
      'days': days,
    };
  }

  factory Repeat.fromMap(Map<String, dynamic> map) {
    return Repeat(
      interval: map['interval'] != null ? map['interval'] as int : null,
      mode:
          map['mode'] != null
              ? RepeatMode.values.firstWhere(
                (e) => e.name == map['mode'],
                orElse: () => RepeatMode.daily,
              )
              : null,
      days:
          map['days'] != null
              ? List<int>.from((map['days'] as List<int>))
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Repeat.fromJson(String source) =>
      Repeat.fromMap(json.decode(source) as Map<String, dynamic>);
}

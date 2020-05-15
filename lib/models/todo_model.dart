import 'dart:math';

import 'package:flutter/foundation.dart';

class TodoModel {
  final String id = Random().nextDouble().toString();
  final String description;
  final DateTime date;
  bool done;

  TodoModel({
    @required this.description,
    @required this.date,
    this.done = false,
  });
}

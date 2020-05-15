import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:todo_list/models/todo_model.dart';

class CheckboxWidget extends StatelessWidget {
  final TodoModel model;
  final Function(bool value) onChanged;

  const CheckboxWidget({Key key, this.model, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: model.done ? context.primaryColor : null,
      shape: CircleBorder(
        side: model.done ? BorderSide.none : BorderSide(),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 24,
          width: 24,
          child: model.done
              ? Icon(Icons.check, color: Colors.white, size: 18)
              : null,
        ),
        onTap: () => onChanged(!model.done),
      ),
    );
  }
}

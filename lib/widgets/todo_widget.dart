import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/widgets/checkbox_widget.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel model;
  final Function(bool value) onChanged;
  final Function onDelete;

  const TodoWidget({Key key, this.model, this.onChanged, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: ListTile(
          trailing: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CheckboxWidget(model: model, onChanged: onChanged),
            SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  Text(
                    model.description,
                    style: model.done
                        ? TextStyle(decoration: TextDecoration.lineThrough)
                        : null,
                  ),
                  Visibility(
                    visible: !model.done,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        DateFormat.Hm().format(model.date),
                        style: context.textTheme.caption,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onDismissed: (_) => onDelete(),
    );
  }
}

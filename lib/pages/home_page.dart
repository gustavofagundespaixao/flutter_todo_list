import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/widgets/todo_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todoItems = List<TodoModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo list')),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: FlutterLogo(
                  colors: context.primaryColor,
                  style: FlutterLogoStyle.stacked,
                  size: 55,
                ),
              ),
              accountName: Text('Todo list'),
              accountEmail: Text('Username'),
            ),
            ListTile(leading: Icon(Icons.list), title: Text('Todo list')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(
          () => todoItems.add(TodoModel(
            description: 'Descrition ${todoItems.length + 1}',
            date: DateTime.now(),
          )),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Today', style: context.textTheme.headline5),
            trailing: IconButton(
              icon: Icon(Icons.event),
              onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime(DateTime.now().year + 1),
              ),
            ),
          ),
          Expanded(
            child: todoItems.isEmpty
                ? Center(child: Text('Todo list is empty'))
                : ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (_, index) => TodoWidget(
                      model: todoItems[index],
                      onChanged: (bool value) => setState(
                        () => todoItems[index].done = value,
                      ),
                      onDelete: () => setState(() => todoItems.removeAt(index)),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

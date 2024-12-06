import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _emailController = TextEditingController();


  final List<Todo> todos = [
    const Todo(
        title: 'Buy milk',
        description: 'There is no milk left in the fridge!',
        priority: Priority.high
    ),
    const Todo(
        title: 'Make the bed',
        description: 'Keep things tidy please..',
        priority: Priority.low
    ),
    const Todo(
        title: 'Pay bills',
        description: 'The gas bill needs paying ASAP.',
        priority: Priority.urgent
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              // obscureText: true,
              decoration: const InputDecoration(
                  label: Text("email")
              ),

            ),
            const SizedBox(height: 8.0),
            FilledButton(onPressed: () {
              print(_emailController);
            }, child: const Text("print form")
            )

            // form stuff below here

          ],
        ),
      ),
    );
  }
}
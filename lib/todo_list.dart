import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({required this.todos, super.key});

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void nada() {}
  bool delete = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton.icon(
          onPressed: () {
            setState(() {
              delete = !delete;
            });
            // widget.todos[index];
            // widget.todos.removeAt(index);
            // setState(() {
            //   widget.todos.removeAt(index);
            // });
          },
          icon: Icon(Icons.delete),
          label: Text(""),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.todos.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      delete
                          ? IconButton(
                              onPressed: () {
                                // widget.todos[index];
                                // widget.todos.removeAt(index);
                                setState(() {
                                  widget.todos.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete))
                          : Text(""),
                      Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: widget.todos[index].priority.color
                                .withOpacity(0.5),
                          ),
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.todos[index].title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      delete
                                          ? Text("")
                                          : Text(
                                              widget.todos[index].description),
                                    ]),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            widget.todos[index].priority.color,
                                      ),
                                      child: Text(
                                          widget.todos[index].priority.title),
                                    ),
                                  ],
                                ),
                              ])),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

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

  // final TextEditingController _emailController = TextEditingController();
  final _formglobalKey = GlobalKey<FormState>();
  Priority _selectedPriority = Priority.low;
  String _title = "";
  String _description = "";

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

            Form(
                key: _formglobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                //   title
                    TextFormField(
                      maxLength: 20,
                      decoration: const InputDecoration(
                        label: Text("Todo Title")
                      ),
                      validator: (value) {
                        if ( value == null || value.isEmpty) {
                          return "input a valid title";
                        }
                        return null;
                      },
                      onSaved: (value) {_title = value!;},
                  ),

              //   description
                    TextFormField(
                      maxLength: 40,
                      decoration: const InputDecoration(
                          label: Text("Todo Decription")
                      ),
                      validator: (value) {
                        if ( value == null || value.isEmpty || value.length < 5) {
                          return "Description must be at least 5 characters long";
                        }
                        return null;
                      },
                      onSaved: (value) {_description = value!;},
                    ),


              //   priority
                    DropdownButtonFormField(
                      value: _selectedPriority,
                        decoration: const InputDecoration(
                            label: Text("Todo Priority")
                        ),

                        items: Priority.values.map((p) {
                          return DropdownMenuItem(value: p, child: Text(p.title),);
                        }).toList(),

                        onChanged: ((value) {
                          _selectedPriority = value!;})
                    ),

              //   submit btn
                    const SizedBox(height: 20.0,),
                    FilledButton(onPressed: (){
                      if (_formglobalKey.currentState!.validate()) {
                        _formglobalKey.currentState!.save();

                        setState(() {
                          todos.add(Todo(
                            title: _title,
                            description: _description,
                            priority: _selectedPriority,
                          ));
                        });
                      }
                      print(_formglobalKey.currentState.toString());
                      _formglobalKey.currentState!.reset();
                      _selectedPriority = Priority.low;
                    }, child: const Text("Add"),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                            )
                          ),
                        )
              ]
              ))
              // form stuff below here

            ],
        ),
      ),
    );
  }
}
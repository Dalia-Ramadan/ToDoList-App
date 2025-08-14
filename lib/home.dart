import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController taskController = TextEditingController();
  List<String> task = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'To Do List',
          style: TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(blurRadius: 5, color: Colors.black),
              Shadow(blurRadius: 5, color: Colors.black),
              Shadow(blurRadius: 5, color: Colors.black),
              Shadow(blurRadius: 5, color: Colors.black),
            ],
            fontWeight: FontWeight.bold,
            fontSize: 25,
            wordSpacing: 10,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 155, 39, 176),const Color.fromARGB(255, 0, 0, 0) ],
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: task.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(92, 255, 255, 255),
                          borderRadius:BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ListTile(
                          iconColor: const Color.fromARGB(255, 255, 255, 255),
                          title: Text(
                            task[index],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                task.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        labelText: 'Task',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 110,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (taskController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(Icons.error, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Enter Your Task'),
                                ],
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            task.add(taskController.text);
                            taskController.clear();
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.blueGrey,
                        ),
                      ),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

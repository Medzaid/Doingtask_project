import 'package:flutter/material.dart';
import 'package:todo_project/Counter.dart';
import 'package:todo_project/Doingtask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Myfirst_app());
  }
}

class Myfirst_app extends StatefulWidget {
  const Myfirst_app({super.key});

  @override
  State<Myfirst_app> createState() => _Myfirst_appState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _Myfirst_appState extends State<Myfirst_app> {
  List allTasks = [
    Task(title: 'reading', status: true),
    Task(title: 'swiming', status: true),
    Task(title: 'gym', status: true),
    Task(title: 'gym', status: true),
  ];
  //pour ajouter un nouveau task.
  addnewTask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: true),
      );
    });
  }
  //pour modifier et calculer le nombre des taches realises.
  calculateCompletedtask() {
    int completedtask = 0;
    setState(() {
      allTasks.forEach((item) {
        if (item.status) {
          completedtask++;
        } else {}
      });
    });
    return completedtask;
  }
  //pour changer l'etat du task de true a false et viceversa.
  changeStatus(index) {
    setState(() {
      allTasks[index].status = !allTasks[index].status;
    });
  }

  deleteTask(int clickedTask) {
    setState(() {
      // int clickedTask;
      allTasks.remove(allTasks[clickedTask]);
    });
  }

  deleteAlltasks() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }





  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.only(top: 22),
                  height: 200,

                  // child: Text('Add',style: TextStyle(fontSize: 22,color: Colors.blue),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        obscureText: true,
                        controller: myController,
                        maxLength: 25,
                        decoration: const InputDecoration(
                          hintText: 'Add new task',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewTask();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 22,
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
            //isScrollControlled: true,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
        title: (const Text(
          'To do app',
          style: TextStyle(fontSize: 25, color: Colors.white),
        )),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              deleteAlltasks();
            },
            icon: const Icon(
              Icons.delete_forever,
              size: 30,
              color: Colors.lime,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Counterapp(
            allTodos: allTasks.length,
            allCompleted: calculateCompletedtask(),
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Doingtask(
                    mytitle: allTasks[index].title,
                    doneornot: allTasks[index].status,
                    deleteTask: deleteTask,
                    deleteAlltasks: deleteAlltasks,
                    changeStatus: changeStatus,
                    index: index,
                  );
                }),
          ),

          // ... allTasks.map((item)=>
          //  ),
        ],
      ),
    );
  }
}

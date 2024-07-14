import 'package:flutter/material.dart';

class Counterapp extends StatelessWidget {
  //const Counterapp({super.key});
 int allCompleted;
  int allTodos;
  Counterapp({
    required this.allCompleted,
  required this.allTodos,
});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(('$allCompleted/$allTodos'),
        style: TextStyle(fontSize: 30,

            color: allCompleted == allTodos? Colors.green : Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

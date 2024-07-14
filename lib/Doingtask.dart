import 'package:flutter/material.dart';

class Doingtask extends StatelessWidget {
  // const Doingtask({super.key});
String mytitle ;
bool doneornot;
 Function deleteTask;
 Function  deleteAlltasks;
 Function  changeStatus;
 int index ;




Doingtask({
  required this.mytitle,
  required this.doneornot,
  required this.deleteTask,
  required this.deleteAlltasks,
  required this. changeStatus,
   required this.index,
});



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mytitle,
                style:
                TextStyle(fontSize: 23,
                  color: doneornot?
                  Colors.white: Colors.amber,
                    decoration:doneornot? TextDecoration.lineThrough:TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(

                    //Icons.check,
                      doneornot? Icons.check : Icons.close,

                      color:  doneornot? Colors.green:Colors.red





                  ),
                  SizedBox(width: 17,),
                  IconButton(
                      onPressed: () {
                        deleteTask(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.redAccent)),

                ],
              ),




            ],
          ),
        ),
      ),
    );


  }
}

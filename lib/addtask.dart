import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  _AddTaskState();

  DateTime? myDay;

  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDFFFD4),
        title: const Text(
          'Add Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffF0F2F0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffEDFFE7),
                      borderRadius: BorderRadius.circular(12)),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 00),
                    child:  TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task Name',
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          )),
                      controller: myController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/img_14.png'))),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        OutlinedButton(
                          onPressed: () async{
                            DateTime? datePicked = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030, 12, 31));
                            myDay = datePicked;
                          },
                          child: const Text(
                            'Due Date',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xffEDFFE7),
                              ),
                              side: MaterialStateProperty.all(BorderSide.none)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 33,
                          width: 33,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/img_17.png'))),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Add Note',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xffEDFFE7),
                              ),
                              side: MaterialStateProperty.all(BorderSide.none)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Consumer<MyProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                  return OutlinedButton(
                    onPressed: () {
                      if(myController.text.isNotEmpty) {
                        value.myTaskNames.add(myController.text);
                        value.myBolBol.add(myDay);
                        value.myValues.add(0);
                        value.notifyListeners();
                        Navigator.pop(context);
                      }
                      else{
                        const snackDemo  = SnackBar(content: Text('Please Enter Task name!'), duration: Duration(seconds: 2),);
                        ScaffoldMessenger.of(context).showSnackBar(snackDemo);
                      }
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xffEDFFE7),
                        ),
                        side: MaterialStateProperty.all(BorderSide.none)),
                  );},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Jaroori Codee
/*Center(
child: Column(children: [
TextField(controller: myController,),
OutlinedButton(onPressed: () async{
DateTime? datePicked = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030, 12, 31));
myDay = datePicked;
setState(() {

});
}, child: const Text('Due Date')),
Consumer<MyProvider>(
builder: (BuildContext context, value, Widget? child) {
return OutlinedButton(onPressed: (){

if(myController.text.isNotEmpty) {
value.myTaskNames.add(myController.text);
value.myBolBol.add(myDay);
value.myValues.add(0);
value.notifyListeners();
Navigator.pop(context);
}
else{
const snackDemo  = SnackBar(content: Text('Please Enter Task name!'), duration: Duration(seconds: 2),);
ScaffoldMessenger.of(context).showSnackBar(snackDemo);
}
}, child: const Text('Done'));}
),
],),
)*/

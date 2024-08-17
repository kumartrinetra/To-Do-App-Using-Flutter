import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController myController = TextEditingController();
  DateTime? myDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen,),
      body: Center(
        child: Consumer<MyProvider>(
          builder: (BuildContext context, value, Widget? child) {
          return Column(children: [
            TextField(controller: value.myController),
            OutlinedButton(onPressed: () async{
              DateTime? datePicked = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030, 12, 31));
              print(datePicked?.day);
              myDay = datePicked;
              setState(() {

              });
            }, child: const Text('Due Date')),
             OutlinedButton(onPressed: (){
                    if(value.myController.text.isNotEmpty) {
                      value.myTaskNames.replaceRange(value.myIndex, value.myIndex+1, [value.myController.text]);
                      value.myBolBol.replaceRange(value.myIndex, value.myIndex+1, [myDay]);
                      value.notifyListeners();
                      Navigator.pop(context);
                    }
                    else{
                      const snackDemo  = SnackBar(content: Text('Please Enter Task name!'), duration: Duration(seconds: 2),);
                      ScaffoldMessenger.of(context).showSnackBar(snackDemo);
                    }
                  }, child: const Text('Done')),
          ],);},
        ),
      ),
    );
  }
}

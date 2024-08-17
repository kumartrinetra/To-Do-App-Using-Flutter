import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/addtask.dart';
import 'package:todo/editpage.dart';
import 'package:todo/myfirstscreen.dart';
import 'package:todo/nextscreen.dart';
import 'package:todo/providers.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [ChangeNotifierProvider(create: (context) => MyProvider())], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFirstScreen(),
    ),);
  }
}
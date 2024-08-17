import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers.dart';

class MyNextScreen extends StatefulWidget {
  const MyNextScreen({super.key});

  @override
  State<MyNextScreen> createState() => _MyNextScreenState();
}

class _MyNextScreenState extends State<MyNextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          child: Center(
              child: Consumer<MyProvider>(
                builder: (BuildContext context, value, Widget? child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                               '${value.count}' ,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          value.ncr();
                          value.notifyListeners();
                        }, icon: Icon(Icons.add), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),),
                        IconButton(onPressed: (){
                          value.dcr();
                          value.notifyListeners();
                        }, icon: Icon(Icons.login_outlined), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),),
                      ],
                    ),
                  ],
                );},
              )),
          color: Colors.green,
        ),
      ),

    );
  }
}

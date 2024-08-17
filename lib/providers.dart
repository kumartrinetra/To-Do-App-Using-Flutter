import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  int count = 0;
  void ncr()
  {
    count++;}
  void dcr()
    {
      count--;}
    TextEditingController myController = TextEditingController();
  List<DateTime?> myBolBol =  [];
  List<String> myTaskNames = [];
  List<int> myValues = [];
  int myIndex = 0;
  List<String> myDoneTasks = [];
  List<DateTime> myCompleteTime = [];
  @override
  void notifyListeners() {

    super.notifyListeners();
  }
}
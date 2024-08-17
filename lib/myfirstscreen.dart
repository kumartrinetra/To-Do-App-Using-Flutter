import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/addtask.dart';
import 'package:todo/editpage.dart';
import 'package:todo/providers.dart';

class MyFirstScreen extends StatefulWidget {
  MyFirstScreen();
  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  List<Widget> mainCheez = [
    Consumer<MyProvider>(
      builder: (BuildContext context, valued, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Completed',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 15,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: valued.myDoneTasks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                            color: const Color(0xffF0F2F0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15, right: 15),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_9.png'))),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -2),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${valued.myDoneTasks[index]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        'Done on: ${valued.myCompleteTime[index].day}/ ${valued.myCompleteTime[index].month}/ ${valued.myCompleteTime[index].year}',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PopupMenuButton(
                                    color: const Color(0xffF4FFF1),
                                    offset: const Offset(5, 45),
                                    surfaceTintColor: Colors.transparent,
                                    elevation: 2,
                                    shadowColor: Colors.transparent,
                                    popUpAnimationStyle:
                                        AnimationStyle.noAnimation,
                                    icon: Icon(Icons.more_vert),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            onTap: () {
                                              DateTime haki = valued.myCompleteTime[index];
                                              String baki = valued.myDoneTasks[index];
                                              valued.myDoneTasks.remove(baki);
                                              valued.myCompleteTime.remove(haki);
                                              valued.notifyListeners();
                                            },
                                            padding: EdgeInsets.zero,
                                            child: Container(
                                              width: 110,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                      child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          child: Image.asset(
                                                              'assets/images/img_11.png'))),
                                                  Text('Delete'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          /*PopupMenuItem(
                                            padding: EdgeInsets.zero,
                                            child: Container(
                                              width: 110,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                        'assets/images/img_13.png'),
                                                  ),
                                                  //SizedBox(width: 6.5,),
                                                  Text('Edit'),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              valued.myController.text =
                                                  valued.myTaskNames[index];
                                              valued.myIndex = index;
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditPage()));
                                            },
                                          ),*/
                                        ]),
                                Transform.translate(offset: Offset(-10, 0),
                                  child: Row(
                                    children: [
                                      Text('Completed', style: TextStyle(color: Color(0xff05850A), fontSize: 12),),
                                      SizedBox(width: 5,),
                                      Icon(Icons.done, color: Color(0xff05850A), size: 20,),
                                    ],
                                  ),
                                ),
                                /*Transform.translate(
                                  offset: Offset(-5, 0),
                                  child: DropdownButton(
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'To Be Completed',
                                          style: TextStyle(
                                              color: Color(0xff373D39),
                                              fontSize: 12),
                                        ),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Ongoing',
                                          style: TextStyle(
                                              color: Color(0xffDAB90B),
                                              fontSize: 12),
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                              color: Color(0xff05850A),
                                              fontSize: 12),
                                        ),
                                        value: 2,
                                      ),
                                    ],
                                    padding: EdgeInsets.zero,
                                    value: valued.myValues[index],
                                    underline: Container(),
                                    alignment: Alignment.bottomRight,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff373D39),
                                      size: 18,
                                    ),
                                    onChanged: (value) {
                                      if (value != null) {
                                        valued.myValues[index] = value;
                                      }
                                    },
                                  ),
                                ),*/
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                })
          ],
        );
      },
    ),
    Consumer<MyProvider>(
      builder: (BuildContext context, valued, Widget? child) {
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: valued.myBolBol.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              valued.myBolBol[index] ?? DateTime.now();
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xffF0F2F0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: 15,
                                  right: 15),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_9.png'))),
                            ),
                            Transform.translate(
                              offset: Offset(0, -2),
                              child: Column(
                                children: [
                                  Text(
                                    "${valued.myTaskNames[index]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Due Date: ${valued.myBolBol[index]?.day}/ ${valued.myBolBol[index]?.month}/ ${valued.myBolBol[index]?.year}',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PopupMenuButton(
                                color: Color(0xffF4FFF1),
                                offset: Offset(5, 60),
                                surfaceTintColor: Colors.transparent,
                                elevation: 2,
                                shadowColor: Colors.transparent,
                                popUpAnimationStyle:
                                AnimationStyle.noAnimation,
                                icon: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      DateTime? haki =
                                      valued.myBolBol[index];
                                      String baki =
                                      valued.myTaskNames[index];
                                      int laki =
                                      valued.myValues[index];
                                      valued.myBolBol.remove(haki);
                                      valued.myTaskNames.remove(baki);
                                      valued.myValues.remove(laki);
                                      valued.notifyListeners();
                                    },
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      width: 110,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Container(
                                              child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  child: Image.asset(
                                                      'assets/images/img_11.png'))),
                                          Text('Delete'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      width: 110,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            child: Image.asset(
                                                'assets/images/img_13.png'),
                                          ),
                                          //SizedBox(width: 6.5,),
                                          Text('Edit'),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      valued.myController.text =
                                      valued.myTaskNames[index];
                                      valued.myIndex = index;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditPage()));
                                    },
                                  ),
                                ]),
                            Transform.translate(
                              offset: Offset(-5, 0),
                              child: DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      'To Be Completed',
                                      style: TextStyle(
                                          color: Color(0xff373D39),
                                          fontSize: 12),
                                    ),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Ongoing',
                                      style: TextStyle(
                                          color: Color(0xffDAB90B),
                                          fontSize: 12),
                                    ),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(
                                          color: Color(0xff05850A),
                                          fontSize: 12),
                                    ),
                                    value: 2,
                                    onTap: (){
                                      String haki = valued.myTaskNames[index];
                                      DateTime? baki = valued.myBolBol[index];
                                      int chaki = valued.myValues[index];
                                      valued.myTaskNames.remove(haki);
                                      valued.myValues.remove(chaki);
                                      valued.myBolBol.remove(baki);
                                      valued.myDoneTasks.add(haki);
                                      valued.myCompleteTime.add(DateTime.now());
                                      valued.notifyListeners();
                                    },
                                  ),
                                ],
                                padding: EdgeInsets.zero,
                                value: valued.myValues[index],
                                underline: Container(),
                                alignment: Alignment.bottomRight,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xff373D39),
                                  size: 18,
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    valued.myValues[index] = value;
                                    valued.notifyListeners();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              );
            });
      },
    ),
  ];
  _MyFirstScreenState();
  var time = DateTime.now();
  int myValue = 0;
  String getDur() {
    if (time.hour >= 0 && time.hour < 12) {
      return 'morning';
    } else if (time.hour >= 12 && time.hour < 16) {
      return 'afternoon';
    }
    return 'evening';
  }

  ScrollController myController = new ScrollController();
  TextEditingController myController1 = new TextEditingController();
  List<DropdownMenuItem> myItems = [
    DropdownMenuItem(child: Text('Today')),
    DropdownMenuItem(child: Text('Tomorrow')),
  ];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffDFFFD4),
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/img_1.png',
                    color: Color(0xff21C34E),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'ToDo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Color(0xff373D39)),
                )
                //DropdownButton(items: myItems, onChanged: (_){},),
              ],
            ),
            PopupMenuButton(
                color: Color(0xffF4FFF1),
                offset: Offset(5, 60),
                surfaceTintColor: Colors.transparent,
                elevation: 2,
                shadowColor: Colors.transparent,
                popUpAnimationStyle: AnimationStyle.noAnimation,
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Container(
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                          'assets/images/img_2.png'))),
                              Text('Stats'),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Container(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset('assets/images/img_3.png'),
                                ),
                                //SizedBox(width: 6.5,),
                                Text('Go Pro'),
                              ],
                            ),
                          )),
                    ]),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          //overlayColor: Colors.transparent,
          backgroundColor: Color(0xffDFFFD4),
          surfaceTintColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xff373D39),
              );
            }
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff373D39),
            );
          }),
          height: 70,
        ),
        child: NavigationBar(
          onDestinationSelected: (index) {
            _currentIndex = index;
            setState(() {});
          },
          selectedIndex: _currentIndex,
          destinations: [
            NavigationDestination(
                selectedIcon: Container(
                  child: Container(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/images/img_1.png')),
                ),
                icon: Container(
                    height: 27,
                    width: 25,
                    child: Image.asset('assets/images/img_4.png')),
                label: 'Done'),
            NavigationDestination(
                selectedIcon: Container(
                  height: 27,
                  width: 27,
                  child: Image.asset('assets/images/img_7.png'),
                ),
                icon: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/images/img_5.png')),
                label: 'To Do'),
            NavigationDestination(
                selectedIcon: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/images/img_8.png'),
                ),
                icon: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/images/img_6.png')),
                label: 'More Tasks'),
          ],
        ),
      ),
      floatingActionButton: ScrollingFabAnimated(
          height: 59,
          width: 145,
          animateIcon: true,
          color: Color(0xff21C34E),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          text: Transform.translate(
              offset: Offset(0, 0),
              child: Text(
                'New Task',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
          onPress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          },
          scrollController: myController),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: ListView(
          controller: myController,
          children: [
            Text(
              '${DateFormat('MMMMEEEEd').format(time)}',
              style: TextStyle(
                  color: Color(0xff373D39),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Good ${getDur()}, Trinetra!',
              style: TextStyle(
                  color: Color(0xff373D39),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            mainCheez[_currentIndex],
            /*Text(
              'Today',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),*/
            /* SizedBox(
              height: 20,
            ),*/
            /* ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myLength(),
                itemBuilder: (context, index) {
                  if (myLength() != 0) {
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Color(0xffF0F2F0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img_9.png'))),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -3),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${myTimeTable[time.day]?[index]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          'Complete till 12:00 PM',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PopupMenuButton(
                                      color: Color(0xffF4FFF1),
                                      offset: Offset(5, 60),
                                      surfaceTintColor: Colors.transparent,
                                      elevation: 2,
                                      shadowColor: Colors.transparent,
                                      popUpAnimationStyle:
                                          AnimationStyle.noAnimation,
                                      icon: Icon(Icons.more_vert),
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                              onTap: (){myTimeTable[time.day]?.remove(myTimeTable[time.day]?[index]
                                                );
                                                print(index);
                                                Navigator.pop(context);
                                              Navigator.pop(context);
                                                setState(() {

                                                });},
                                              padding: EdgeInsets.zero,
                                              child: Container(
                                                width: 110,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                        child: Container(
                                                            height: 25,
                                                            width: 25,
                                                            child: Image.asset(
                                                                'assets/images/img_11.png'))),
                                                    Text('Delete'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: Container(
                                                  width: 110,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: 24,
                                                        width: 24,
                                                        child: Image.asset(
                                                            'assets/images/img_13.png'),
                                                      ),
                                                      //SizedBox(width: 6.5,),
                                                      Text('Edit'),
                                                    ],
                                                  ),
                                                ), onTap: (){myTimeTable[time.day]?.remove(myTimeTable[time.day]?[index]);
                                                  Navigator.pop(context);},),
                                          ]),
                                  Transform.translate(offset: Offset(-5, 0),
                                    child: DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                            'To Be Completed',
                                            style: TextStyle(
                                                color: Color(0xff373D39),
                                                fontSize: 12),
                                          ),
                                          value: 0,
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Ongoing',
                                            style: TextStyle(
                                                color: Color(0xffDAB90B),
                                                fontSize: 12),
                                          ),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Completed',
                                            style: TextStyle(
                                                color: Color(0xff05850A),
                                                fontSize: 12),
                                          ),
                                          value: 2,
                                        ),
                                      ],
                                      padding: EdgeInsets.zero,
                                      value: myValue,
                                      underline: Container(),
                                      alignment: Alignment.bottomRight,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xff373D39),
                                        size: 18,
                                      ),
                                      onChanged: (value) {
                                        if (value != null) {
                                          myValue = value;
                                        }
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } return Container(height: 100,width: 100,decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/img_10.png'))),);
                }),*/
            /*SizedBox(
              height: 10,
            ),*/
            /*Text(
              'Tomorrow',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),*/
            /*SizedBox(
              height: 20,
            ),*/
            /*ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myLength(1),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color(0xffF0F2F0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15, right: 15),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_9.png'))),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -3),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${myTimeTable[time.day + 1]?[index]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        'Due ${DateTime.now().day + 1}/${DateTime.now().month}/${DateTime.now().year}',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PopupMenuButton(
                                    color: Color(0xffF4FFF1),
                                    offset: Offset(-10, 50),
                                    surfaceTintColor: Colors.transparent,
                                    elevation: 2,
                                    shadowColor: Colors.transparent,
                                    popUpAnimationStyle:
                                    AnimationStyle.noAnimation,
                                    icon: Icon(Icons.more_vert),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        onTap: (){myTimeTable[time.day+1]?.remove(myTimeTable[time.day+1]?[index]);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        print(index);
                                        setState(() {
                                        });},
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          width: 110,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              Container(
                                                  child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      child: Image.asset(
                                                          'assets/images/img_11.png'))),
                                              Text('Delete'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem(
                                          padding: EdgeInsets.zero,
                                          child: Container(
                                            width: 110,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  child: Image.asset(
                                                      'assets/images/img_13.png'),
                                                ),
                                                //SizedBox(width: 6.5,),
                                                Text('Edit'),
                                              ],
                                            ),
                                          ), onTap: (){
                                        myTimeTable[time.day+1]?.remove(myTimeTable[time.day+1]?[index]);
                                            Navigator.pop(context);
                                      },),
                                    ]
                                ),
                                Transform.translate(offset: Offset(-5, 0),
                                  child: DropdownButton(
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'To Be Completed',
                                          style: TextStyle(
                                              color: Color(0xff373D39),
                                              fontSize: 12),
                                        ),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Ongoing',
                                          style: TextStyle(
                                              color: Color(0xffDAB90B),
                                              fontSize: 12),
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                              color: Color(0xff05850A),
                                              fontSize: 12),
                                        ),
                                        value: 2,
                                      ),
                                    ],
                                    padding: EdgeInsets.zero,
                                    value: myValue,
                                    underline: Container(),
                                    alignment: Alignment.bottomRight,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff373D39),
                                      size: 18,
                                    ),
                                    onChanged: (value) {
                                      if (value != null) {
                                        myValue = value;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }),*/
          ],
        ),
      ),
    );
  }
}

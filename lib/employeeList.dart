import 'dart:convert';

import 'package:f5_technologies/employeeDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

class EmployeeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List _employeeList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String res = await rootBundle.loadString('assets/employees.json');
    final data = await json.decode(res);
    setState(() {
      _employeeList = data;
    });
    // print(_employeeList[0]['firstName']);
    // print(_employeeList.length);
    print(_employeeList[0].runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Info'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _employeeList.isNotEmpty
                ? SizedBox(
                    height: 800,
                    child: AlphabetScrollView(
                      alignment: LetterAlignment.right,
                      itemExtent: 70,
                      list: _employeeList
                          .map((e) => AlphaModel(e.toString()))
                          .toList(),
                      selectedTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      unselectedTextStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      overlayWidget: (value) => Stack(
                        children: [
                          Icon(
                            Icons.star,
                            size: 50,
                            color: Colors.red,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$value'.toUpperCase(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext, int, String) {
                        return ListTile(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmployeeDetails(
                                          employeeDetails: _employeeList[int],
                                        )))
                          },
                          leading: SizedBox(
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Image.network(
                                    _employeeList[int]['imageUrl']),
                              )),
                          title: Text(
                              '${_employeeList[int]['firstName']} ${_employeeList[int]['lastName']}'),
                        );
                      },
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 400,
                      ),
                      Center(child: CircularProgressIndicator()),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Please Wait...',
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

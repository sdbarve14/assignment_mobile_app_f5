import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final Map<String, dynamic> employeeDetails;

  const EmployeeDetails({super.key, required this.employeeDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Info'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              width: 460,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Employee Details',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.network(employeeDetails['imageUrl'])),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Name : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                          '${employeeDetails['firstName']} ${employeeDetails['lastName']}')
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Email : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('${employeeDetails['email']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Age : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('${employeeDetails['age']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'DOB : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('${employeeDetails['dob']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Salary : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('${employeeDetails['salary']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Address : ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('${employeeDetails['address']}'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

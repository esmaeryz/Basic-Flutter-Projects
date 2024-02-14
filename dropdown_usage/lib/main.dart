import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Faculty and Department Selection'),
        ),
        body: FacultyDepartmentForm(),
      ),
    );
  }
}

class FacultyDepartmentForm extends StatefulWidget {
  @override
  _FacultyDepartmentFormState createState() => _FacultyDepartmentFormState();
}

class _FacultyDepartmentFormState extends State<FacultyDepartmentForm> {
  String? selectedFaculty;
  String? selectedDepartment;

  List<String> engineeringDepartments = [
    'Chemical Engineering',
    'Electrical Engineering',
    'Computer Engineering',
    'Food Engineering',
  ];

  List<String> fineArtsDepartments = [
    'Painting',
    'Graphic Design',
    'Cinema and Television',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text('Faculty of Engineering'),
            value: 'Faculty of Engineering',
            groupValue: selectedFaculty,
            onChanged: (String? value) {
              setState(() {
                selectedFaculty = value;
                selectedDepartment = null;
              });
            },
          ),
          RadioListTile(
            title: Text('Faculty of Fine Arts'),
            value: 'Faculty of Fine Arts',
            groupValue: selectedFaculty,
            onChanged: (String? value) {
              setState(() {
                selectedFaculty = value;
                selectedDepartment = null;
              });
            },
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedDepartment,
              items: selectedFaculty == 'Faculty of Engineering'
                  ? engineeringDepartments.map((String department) {
                      return DropdownMenuItem<String>(
                        value: department,
                        child: Text(department),
                      );
                    }).toList()
                  : fineArtsDepartments.map((String department) {
                      return DropdownMenuItem<String>(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDepartment = newValue;
                });
              },
              style: TextStyle(color: Colors.black),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              underline: Container(
                height: 2,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

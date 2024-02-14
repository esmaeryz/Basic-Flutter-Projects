import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test App"),
        ),
        body: ShippingPrice(),
      ),
    );
  }
}

class ShippingPrice extends StatefulWidget {
  @override
  _ShippingPrice createState() => _ShippingPrice();
}

class _ShippingPrice extends State<ShippingPrice> {
  bool isboxcheck = false;
  String? selectedCity;
  String spValue = "";
  var sp;
  var pw;
  var ph;
  var pd;

  TextEditingController contentControl1 = TextEditingController();
  TextEditingController contentControl2 = TextEditingController();
  TextEditingController contentControl3 = TextEditingController();
  TextEditingController contentControl4 = TextEditingController();

  List<String> cityDetails = [
    'Mersin',
    'İzmir',
    'Ankara',
    'İstanbul',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: contentControl1,
              decoration: InputDecoration(
                hintText: "Sending Number",
                labelText: "Sending Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: contentControl2,
              decoration: InputDecoration(
                hintText: "Package Width",
                labelText: "Package Width",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: contentControl3,
              decoration: InputDecoration(
                hintText: "Package Height",
                labelText: "Package Height",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: contentControl4,
              decoration: InputDecoration(
                hintText: "Package depth",
                labelText: "Package depth",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          CheckboxListTile(
            value: isboxcheck,
            onChanged: (value) {
              setState(() {
                isboxcheck = value!;
              });
            },
            title: Text(
              "Sender Pay",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            activeColor: Colors.cyan,
            checkColor: Colors.black,
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedCity,
              items: cityDetails.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
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
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Show"),
            onPressed: () {
              if (isboxcheck) {
                setState(() {
                  spValue = "Shipping is free";
                });
              }
              if (isboxcheck == false) {
                setState(() {
                  pw = double.parse(contentControl2.text);
                  ph = double.parse(contentControl3.text);
                  pd = double.parse(contentControl4.text);
                  sp = pw * ph * pd / 3000;
                  spValue = sp.toString();
                });
              }
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              spValue,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navbar_example/modelSamples.dart';

class TaxCounting extends StatefulWidget {
  @override
  State<TaxCounting> createState() => _TaxCountingState();
}

class _TaxCountingState extends State<TaxCounting> {
  String? selectedModel = "NOTHING";
  String checktext = "";
  bool isboxcheck = false;
  double taxvalueraw = 0;
  String taxvalue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tax Calculation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: phoneModelslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: Icon(Icons.check),
                    title: Text(phoneModelslist[index].modelName!),
                    subtitle: Text(
                        "Profession: ${phoneModelslist[index].modelName!}"),
                    onTap: () {
                      setState(() {
                        taxvalueraw = phoneModelslist[index].modelPrice! * 0.4;
                        selectedModel =
                            "Price: ${phoneModelslist[index].modelPrice!}";
                      });
                    },
                  );
                },
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
                "CheckBoxListTile",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              child: Text(
                "Show Price",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                checktext = "";
                taxvalue = "";

                setState(() {
                  checktext = checktext + " $selectedModel";
                });
                setState(() {
                  taxvalue = taxvalue + " Tax Price: $taxvalueraw";
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      checktext,
                      style: TextStyle(
                        backgroundColor: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      taxvalue,
                      style: TextStyle(
                        backgroundColor: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

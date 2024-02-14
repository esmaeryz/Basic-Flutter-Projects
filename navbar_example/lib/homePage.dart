import 'package:flutter/material.dart';
import 'package:navbar_example/modelSamples.dart';
import 'package:navbar_example/taxCounting.dart';
import 'package:navbar_example/information.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int activepage = 0;
  List<Widget>? pagecontent;

  @override
  void initState() {
    super.initState();
    pagecontent = [
      HomePage(),
      TaxCounting(),
      information(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagecontent![activepage],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(size: 35),
        iconSize: 20,
        currentIndex: activepage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade100,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: "ProductList"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "TaxCounting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Information"),
        ],
        onTap: (int checkediconindex) {
          setState(() {
            activepage = checkediconindex;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController contentControl1 = TextEditingController();
  TextEditingController contentControl2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular Phone List")),
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
                          "${phoneModelslist[index].modelPrice.toString()}"),
                      onTap: () {
                        contentControl1.text =
                            "${phoneModelslist[index].modelName}";
                        contentControl2.text =
                            "${phoneModelslist[index].modelPrice.toString()}";
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: contentControl1,
                  decoration: InputDecoration(
                    labelText: "Phone Name ",
                    hintText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: contentControl2,
                  decoration: InputDecoration(
                    labelText: "Phone Price",
                    hintText: "Price",
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

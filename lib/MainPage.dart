import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String results = "";
  String selectedCycle = "Normal";

  // input  machine capacity,number of clothes, wash cycle type

  TextEditingController clothesController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  FocusNode clothesFocus = FocusNode();
  FocusNode capacityFocus = FocusNode();
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (width > 600) {
      width = 600;
    } else {
      width = width;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laundry Load Planner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: width,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 175, child: Text("Number of Clothes:", style: TextStyle(fontSize: 16))),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            focusNode: clothesFocus,
                            controller: clothesController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '(e.g. 10)',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 175,
                          child: Text("Machine Capacity (kg):", style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            focusNode: capacityFocus,
                            controller: capacityController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '(e.g. 18)',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 175,
                          child: Text("Machine Cycle Type:", style: TextStyle(fontSize: 16)),
                        ),
                        DropdownButton<String>(
                          value: selectedCycle,
                          items: <String>["Normal", "Heavy", "Quick"].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCycle = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: calculateLoad,
                            child: Text('Calculate'),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              clothesController.clear();
                              capacityController.clear();
                              selectedCycle = "Normal";

                              FocusScope.of(context).requestFocus(clothesFocus);
                              clothesFocus.requestFocus();

                              setState(() {
                                results = "";
                              });
                            },
                            child: Text('Reset'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    if (results.isNotEmpty)
                    
                    Container(
                      
                      width: 500,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[200]
                      ),
                      child: Text(
                        results,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateLoad() {
    double water = 0.0;
    double time = 0.0;

    int cloth = int.tryParse(clothesController.text) ?? 0;
    int capacity = int.tryParse(capacityController.text) ?? 0;

    if (capacity <= 0 || cloth <= 0) {
      SnackBar snackBar = const SnackBar(
        content: Text('Please enter a valid number for both.', style: TextStyle(fontSize: 20)),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    switch (selectedCycle) {
      case "Normal":
        water = 50;
        time = 30;
        break;
      case "Heavy":
        water = 70;
        time = 45;
        break;
      case "Quick":
        water = 30;
        time = 20;
        break;
    }
    // through google search total water usage is loads multiple water
    // total time is loads multiple time
    int loads = (cloth / capacity).ceil();
    double totalWater = loads * water;
    double totalTime = loads * time;

    setState(() {
      results =
          "Total Loads: $loads\nTotal Water Usage: ${totalWater}L\nTotal Time: $totalTime minutes";
    });
  }
}

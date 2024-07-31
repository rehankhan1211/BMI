import 'package:flutter/material.dart';
import 'package:bmi/component/condition.dart';


class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  BMIState createState() => BMIState();
}

class BMIState extends State<BMI> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiStatus = ("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Convertor"),
        backgroundColor: Theme.of(context).colorScheme.primary,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
          'assets/bmi.jpg',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          ),
            const SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Enter height (cm)',
              border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              ),
              child: const Text('Calculate BMI',
              style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "BMI: ${bmiResult.toStringAsFixed(1)}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
                "Status: ${getBmiStatus(bmiResult)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
          ],
        ),
      ),
    );
  }
  void calculateBMI() {
    if (heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty) {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      double heightInMeters = height / 100;
      double bmi = weight / (heightInMeters * heightInMeters);

      setState(
            () {
          bmiResult = bmi;
          bmiStatus = bmiStatus;
        },
      );
    }
  }
}
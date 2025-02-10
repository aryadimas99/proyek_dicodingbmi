import 'package:flutter/material.dart';
import 'package:proyek_dicodingbmi/gradient_container.dart';

class ScreenResult extends StatelessWidget {
  final double bmi;

  const ScreenResult({super.key, required this.bmi});

  String getResultMessage() {
    if (bmi < 18.5) {
      return "You are underweight.\nYou should eat more nutritious food.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "You have a normal body weight.\nGood Job!";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "You are overweight.\nTry to maintain a healthier lifestyle.";
    } else {
      return "You are obese.\nConsider consulting a health professional.";
    }
  }

  String getResultCategory() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  static const Color primaryColor = Color.fromARGB(255, 1, 29, 43);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Staatliches',
            ),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: GradientContainer(
        const Color.fromARGB(255, 30, 16, 16),
        primaryColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'YOUR RESULT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Staatliches',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 29, 43),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getResultCategory(),
                              style: TextStyle(
                                  fontSize: 50,
                                  color: bmi < 18.5
                                      ? Colors.blueAccent
                                      : (bmi <= 24.9
                                          ? Colors.greenAccent
                                          : (bmi <= 29.9
                                              ? Colors.orangeAccent
                                              : Colors.redAccent))),
                            ),
                            Text(bmi.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontFamily: "Oxygen",
                                    fontWeight: FontWeight.bold)),
                            Text(
                              getResultMessage(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Oxygen",
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    "Re-Calculate",
                    style: TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

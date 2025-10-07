import 'package:flutter/material.dart';
import 'package:proyek_dicodingbmi/gradient_container.dart';
import 'package:proyek_dicodingbmi/screen_result.dart';
import 'package:proyek_dicodingbmi/widgets/body_cart.dart';
import 'package:proyek_dicodingbmi/widgets/gender_cart.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool? isMaleSelected;
  double _currentHeight = 100;
  int _weight = 0;
  int _age = 0;

  static const Color primaryColor = Color.fromARGB(255, 1, 29, 43);
  static const Color inactiveColor = Colors.grey;

  void _calculateBMI() {
    // logika menghitung BMI
    double heightInMeter = _currentHeight / 100;
    double bmi = _weight / (heightInMeter * heightInMeter);

    // kirim data BMI ke screen_result
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenResult(
            bmi: bmi,
          ),
        )).then((shouldeReset) {
      if (shouldeReset == true) {
        _resetValues();
      }
    });
  }

  void _resetValues() {
    setState(() {
      isMaleSelected = null;
      _currentHeight = 100;
      _weight = 0;
      _age = 0;
    });
  }

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
      ),
      body: GradientContainer(
        const Color.fromARGB(255, 30, 16, 16),
        primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 👇 Bagian yang bisa discroll
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GenderCart(
                                isSelected: isMaleSelected == true,
                                icon: Icons.male,
                                label: "Male",
                                onTap: () =>
                                    setState(() => isMaleSelected = true),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GenderCart(
                                isSelected: isMaleSelected == false,
                                icon: Icons.female,
                                label: "Female",
                                onTap: () =>
                                    setState(() => isMaleSelected = false),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),

                        // height card
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Height",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                                Text(
                                  "${_currentHeight.toStringAsFixed(0)} cm",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Oxygen',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Slider(
                                  value: _currentHeight,
                                  min: 100,
                                  max: 250,
                                  divisions: 150,
                                  thumbColor: Colors.red,
                                  activeColor: Colors.red,
                                  inactiveColor: inactiveColor,
                                  label:
                                      "${_currentHeight.toStringAsFixed(0)} cm",
                                  onChanged: (v) =>
                                      setState(() => _currentHeight = v),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: BodyCart(
                                label: "Weight",
                                value: _weight,
                                onIncrement: () => setState(() => _weight++),
                                onDecrement: () => setState(() {
                                  if (_weight > 0) _weight--;
                                }),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: BodyCart(
                                label: "Age",
                                value: _age,
                                onIncrement: () => setState(() => _age++),
                                onDecrement: () => setState(() {
                                  if (_age > 0) _age--;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 👇 Tombol fixed di bawah
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _calculateBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontFamily: 'Staatliches', fontSize: 20),
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

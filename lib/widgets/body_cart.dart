import 'package:flutter/material.dart';

class BodyCart extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  // final int number;

  const BodyCart(
      {super.key,
      required this.label,
      required this.value,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 29, 43),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Staatliches',
                  color: Colors.white,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(value.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: "Oxygen",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white24,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: onDecrement,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white24,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: onIncrement,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

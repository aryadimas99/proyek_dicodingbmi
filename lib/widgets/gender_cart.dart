import 'package:flutter/material.dart';

class GenderCart extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const GenderCart(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (icon == Icons.male ? Colors.blue : Colors.pink)
              : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
            Text(label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}

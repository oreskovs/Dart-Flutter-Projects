import 'package:flutter/material.dart';

class AdditionalInfoWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalInfoWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 15),
          Text(label, style: TextStyle(fontSize: 15)),
          SizedBox(height: 15),
          Text(
            value,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

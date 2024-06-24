import 'package:flutter/material.dart';

class InformationRow extends StatelessWidget {
  final String label;
  final String? value;

 const InformationRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              value!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

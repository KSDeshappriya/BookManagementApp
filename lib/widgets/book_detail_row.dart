import 'package:flutter/material.dart';

Widget buildBookDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}

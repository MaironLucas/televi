import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key, required this.avgNote, required this.date})
      : super(key: key);

  final double avgNote;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Nota:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                avgNote.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: avgNote > 7 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          Chip(
              backgroundColor: Colors.yellow.withOpacity(0.4),
              padding: const EdgeInsets.all(10),
              avatar: const Icon(Icons.calendar_today, size: 16),
              label: Text(
                DateFormat("dd/MM/yyyy").format(date),
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}

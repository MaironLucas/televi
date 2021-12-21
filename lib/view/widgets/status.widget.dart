import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text(
                "Nota:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "9.9",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Chip(
              backgroundColor: Colors.yellow.withOpacity(0.4),
              padding: const EdgeInsets.all(10),
              avatar: const Icon(Icons.calendar_today, size: 16),
              label: const Text(
                "03/04/2001",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}

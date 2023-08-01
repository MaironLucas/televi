import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:televi/generated/l10n.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    required this.avgNote,
    required this.date,
    required this.padding,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final double avgNote;
  final DateTime date;
  final double padding;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final _locationCod = Localizations.localeOf(context).countryCode;

    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        bottom: padding,
        top: padding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                S.of(context).grade,
                style: TextStyle(fontSize: fontSize),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                avgNote.toString(),
                style: TextStyle(
                  fontSize: fontSize,
                  color: avgNote > 7 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          Chip(
            backgroundColor: Colors.red.withOpacity(0.6),
            padding: EdgeInsets.all(padding),
            avatar: Icon(Icons.calendar_today, size: fontSize - 1),
            label: Text(
              _locationCod == 'BR'
                  ? DateFormat('dd/MM/yyyy').format(date)
                  : DateFormat('yyyy-MM-dd').format(date),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: fontSize - 1),
            ),
          ),
        ],
      ),
    );
  }
}

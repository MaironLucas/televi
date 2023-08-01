import 'package:flutter/material.dart';
import 'package:televi/generated/l10n.dart';

class WarningMessage extends StatelessWidget {
  const WarningMessage(
      {required this.message, required this.refreshFunction, Key? key})
      : super(key: key);

  final String message;
  final Function() refreshFunction;
  @override
  Widget build(BuildContext context) => Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.warning,
                  size: 64,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: refreshFunction,
                  child: Text(
                    S.of(context).tryAgain,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

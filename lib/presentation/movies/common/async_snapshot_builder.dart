import 'package:flutter/material.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/common/centralized_progress.dart';
import 'package:televi/presentation/movies/common/warning_message.dart';

class AsyncSnapshotBuilder<Loading, Error, Success> extends StatelessWidget {
  const AsyncSnapshotBuilder(
      {required this.snapshot,
      required this.onTryAgain,
      required this.successWidgetBuilder,
      Key? key})
      : super(key: key);

  final AsyncSnapshot snapshot;
  final GestureTapCallback onTryAgain;
  final Widget Function(BuildContext context, Success success)
      successWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final snapshotData = snapshot.data;
    if (snapshotData == null || snapshotData is Loading) {
      return const CentralizedProgress(
        key: ValueKey('loading-state'),
      );
    }

    if (snapshotData is Error) {
      String message;
      final convertedSnapshotData = snapshotData as GenericError;
      switch (convertedSnapshotData.errorType) {
        case MyErrorType.responseError:
          message = S.of(context).responseError;
          break;
        case MyErrorType.timeoutError:
          message = S.of(context).timeoutError;
          break;
        case MyErrorType.unknowError:
          message = S.of(context).unknowError;
          break;
      }
      return WarningMessage(
        message: message,
        refreshFunction: onTryAgain,
        key: const ValueKey('error-state'),
      );
    } else {
      return successWidgetBuilder(context, snapshotData);
    }
  }
}

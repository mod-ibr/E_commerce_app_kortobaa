import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';

import '../../error/failures.dart';

String mapFailureToMessage(Failure failure, BuildContext context) {
  final locale = getL10n(context);
  switch (failure.runtimeType) {
    case ServerFailure:
      return locale.serverFailureMessage;
    case OfflineFailure:
      return locale.offlineFailureMessage;

    case WrongAccountFailure:
      return locale.wrongAccountFailureMessage;
    case ExistAccountFailure:
      return locale.existAccountFailureMessage;

    default:
      return locale.unexpectedFailureMessage;
  }
}

library core;

import 'package:flutter/foundation.dart';

//gap
export 'package:arosa_je/core/theme/app_gap.dart';
//get
export 'package:get/get.dart';

//l10n
export "l10n/l10n.dart";

printDebug(String message) {
  if (kDebugMode) {
    print(message);
  }
}

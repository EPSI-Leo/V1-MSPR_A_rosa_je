library core;

import 'package:flutter/foundation.dart';

//gap
export 'package:arosa_je/core/theme/app_gap.dart';
//get
export 'package:get/get.dart';

//l10n
export "l10n/l10n.dart";
//themes
export "theme/app_animations.dart";
export "theme/app_colors.dart";
export "theme/app_icon_sizes.dart";
export "theme/app_images.dart";
export "theme/app_radius.dart";
export "theme/app_spacing.dart";
export "theme/app_text_styles.dart";

printDebug(String message) {
  if (kDebugMode) {
    print(message);
  }
}

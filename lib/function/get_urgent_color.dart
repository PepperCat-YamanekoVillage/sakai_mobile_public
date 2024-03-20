import 'package:flutter/material.dart';

import 'package:sakai_mobile/const/color.dart';

Color getUrgentColor(int dueTime) {
  int nowSecondsSinceEpoch = (DateTime.now().millisecondsSinceEpoch ~/ 1000);

  return switch (dueTime - nowSecondsSinceEpoch) {
    < 0 => DueStateColor.PURPLE,
    < 86400 => DueStateColor.RED,
    < 259200 => DueStateColor.ORANGE,
    < 604800 => DueStateColor.GREEN,
    _ => DueStateColor.WHITE,
  };
}

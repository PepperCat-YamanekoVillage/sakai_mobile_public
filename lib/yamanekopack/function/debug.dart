import 'dart:developer';
import 'package:flutter/foundation.dart';

void pudding(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

void longPudding(String str) {
  if (kDebugMode) {
    log('flutter: $str');
  }
}

bool isDebug() {
  return kDebugMode;
}

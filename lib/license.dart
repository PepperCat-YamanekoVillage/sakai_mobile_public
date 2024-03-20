import 'package:flutter/foundation.dart';

void addLicense() {
  LicenseRegistry.addLicense(() => Stream<LicenseEntry>.value(
        const LicenseEntryWithLineBreaks(
          <String>['xxx'],
          '''xxx''',
        ),
      ));
}

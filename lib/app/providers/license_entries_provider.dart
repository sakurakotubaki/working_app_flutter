import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [LicenseRegistry] の全エントリ（`LicenseEntry` は code generation 非対応のため手書き [FutureProvider]）。
final licenseEntriesProvider = FutureProvider<List<LicenseEntry>>((ref) async {
  final out = <LicenseEntry>[];
  await for (final entry in LicenseRegistry.licenses) {
    out.add(entry);
  }
  return out;
});

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'license_entries_provider.g.dart';

/// [LicenseRegistry] の全エントリ（`LicenseEntry` は code generation 非対応のため手書き [FutureProvider]）。
@Riverpod(keepAlive: true)
Future<List<LicenseEntry>> licenseEntries(Ref ref) async {
  final out = <LicenseEntry>[];
  await for (final entry in LicenseRegistry.licenses) {
    out.add(entry);
  }
  return out;
}
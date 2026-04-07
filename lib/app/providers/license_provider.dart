import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'license_entries_provider.dart';

part 'license_provider.g.dart';

/// [LicensePage] に表示するアプリ名（[pubspec.yaml] の name に合わせる）。
@riverpod
String applicationLicenseName(Ref ref) => 'working_app_flutter';

/// [LicensePage] に表示するバージョン（必要に応じて [pubspec.yaml] の version と揃える）。
@riverpod
String applicationLicenseVersion(Ref ref) => '0.1.0';

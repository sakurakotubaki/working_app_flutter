// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// [LicensePage] に表示するアプリ名（[pubspec.yaml] の name に合わせる）。

@ProviderFor(applicationLicenseName)
final applicationLicenseNameProvider = ApplicationLicenseNameProvider._();

/// [LicensePage] に表示するアプリ名（[pubspec.yaml] の name に合わせる）。

final class ApplicationLicenseNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// [LicensePage] に表示するアプリ名（[pubspec.yaml] の name に合わせる）。
  ApplicationLicenseNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationLicenseNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationLicenseNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return applicationLicenseName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$applicationLicenseNameHash() =>
    r'd4e674375cd7f80c663e14e961e452cf7e0ad56f';

/// [LicensePage] に表示するバージョン（必要に応じて [pubspec.yaml] の version と揃える）。

@ProviderFor(applicationLicenseVersion)
final applicationLicenseVersionProvider = ApplicationLicenseVersionProvider._();

/// [LicensePage] に表示するバージョン（必要に応じて [pubspec.yaml] の version と揃える）。

final class ApplicationLicenseVersionProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// [LicensePage] に表示するバージョン（必要に応じて [pubspec.yaml] の version と揃える）。
  ApplicationLicenseVersionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationLicenseVersionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationLicenseVersionHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return applicationLicenseVersion(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$applicationLicenseVersionHash() =>
    r'5769068ef1fb1e10a9d628bb2496cec907f9d066';

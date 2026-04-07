// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_entries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// [LicenseRegistry] の全エントリ（`LicenseEntry` は code generation 非対応のため手書き [FutureProvider]）。

@ProviderFor(licenseEntries)
final licenseEntriesProvider = LicenseEntriesProvider._();

/// [LicenseRegistry] の全エントリ（`LicenseEntry` は code generation 非対応のため手書き [FutureProvider]）。

final class LicenseEntriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LicenseEntry>>,
          List<LicenseEntry>,
          FutureOr<List<LicenseEntry>>
        >
    with
        $FutureModifier<List<LicenseEntry>>,
        $FutureProvider<List<LicenseEntry>> {
  /// [LicenseRegistry] の全エントリ（`LicenseEntry` は code generation 非対応のため手書き [FutureProvider]）。
  LicenseEntriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'licenseEntriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$licenseEntriesHash();

  @$internal
  @override
  $FutureProviderElement<List<LicenseEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LicenseEntry>> create(Ref ref) {
    return licenseEntries(ref);
  }
}

String _$licenseEntriesHash() => r'7d3f7aaf3b18c94edbd112a96290ea1dc0717890';

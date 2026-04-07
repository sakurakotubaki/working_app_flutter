import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [ProviderScope] / [ProviderContainer] 用のリトライ。
///
/// Riverpod 3 では非同期系プロバイダが失敗したとき、要素側で次の順で解決される:
/// `origin.retry` → `container.retry` → [ProviderContainer.defaultRetry]
/// （[ProviderElement.triggerRetry] 参照）。
///
/// [ProviderContainer.defaultRetry] の挙動（`package:riverpod` 実装に準拠）:
/// - [retryCount] が上限（既定 10 回）に達したら `null` を返しリトライ終了
/// - [error] が [ProviderException] または [Error] のときはリトライしない（`null`）
/// - それ以外は指数バックオフ: `minDelay * 2^retryCount`、上限 `maxDelay`（既定 200ms〜6400ms）
///
/// アプリ全体で上限や遅延を変えたい場合は、下記の名前付き引数を調整する。
Duration? globalProviderRetry(int retryCount, Object error) {
  return ProviderContainer.defaultRetry(
    retryCount,
    error,
    maxRetries: 10,
    maxDelay: const Duration(milliseconds: 6400),
    minDelay: const Duration(milliseconds: 200),
  );
}

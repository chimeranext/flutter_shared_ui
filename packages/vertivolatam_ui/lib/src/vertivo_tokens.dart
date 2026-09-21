import 'package:flutter/material.dart';
import 'package:shared_ui_core/shared_ui_core.dart';

/// Typed access to the Vertivo brand tokens (style-dictionary source).
/// Canonical values mirror `style-dictionary/tokens.json`:
/// primary #772583, secondary #CEDC00, accent #5E7E29,
/// surface #FFFFFF/#1A1A2E, error #F4493A.
class VertivoTokens {
  VertivoTokens._();

  static DesignTokenModel? _tokens;

  /// Load from the brand asset paths (app-local first, package fallback).
  static Future<void> initialize() async {
    _tokens ??= await TokensReader.load([
      'assets/style_dictionary/tokens.json',
      'packages/vertivolatam_ui/assets/style_dictionary/tokens.json',
    ]);
  }

  /// Override for tests / previews.
  @visibleForTesting
  static void debugSetTokens(DesignTokenModel tokens) => _tokens = tokens;

  static DesignTokenModel get tokens {
    final t = _tokens;
    if (t == null) {
      throw StateError('VertivoTokens.initialize() must be awaited first');
    }
    return t;
  }

  static bool get isLoaded => _tokens != null;
}

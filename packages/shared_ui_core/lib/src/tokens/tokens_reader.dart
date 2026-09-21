import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'design_token_model.dart';

/// Centralized style-dictionary `tokens.json` reader (ported from
/// vertivo_flutter's TokenService). Brand packages call [load] with their
/// own asset paths; the parsing logic lives here, once.
///
/// ```dart
/// final tokens = await TokensReader.load([
///   'assets/style_dictionary/tokens.json',
///   'packages/vertivolatam_ui/assets/style_dictionary/tokens.json',
/// ]);
/// ```
class TokensReader {
  TokensReader._();

  /// Tries each asset path in order, returns the first that parses.
  /// Throws the last error if none succeed.
  static Future<DesignTokenModel> load(List<String> assetPaths) async {
    Object? lastError;
    for (final path in assetPaths) {
      try {
        final response = await rootBundle.loadString(path);
        final data = json.decode(response) as Map<String, dynamic>;
        return DesignTokenModel.fromJson(data);
      } catch (e) {
        lastError = e;
        debugPrint('TokensReader: skip $path ($e)');
      }
    }
    throw Exception('TokensReader: no tokens.json found. Last: $lastError');
  }

  /// Synchronous parse for tests and codegen outputs.
  static DesignTokenModel parse(String jsonString) {
    return DesignTokenModel.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }
}

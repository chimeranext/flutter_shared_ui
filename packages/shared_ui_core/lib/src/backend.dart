import 'package:flutter/widgets.dart';

/// UI backend selector. Default is [material] (drop-in via pkg:material_ui).
/// Switch to [fluent] to render with fluent_2 (zero Material).
enum UiBackend { material, fluent, cupertino }

/// Global backend choice. Set once at startup before building the tree.
class ChimeranextUi {
  ChimeranextUi._();

  static UiBackend backend = UiBackend.material;

  static bool get isMaterial => backend == UiBackend.material;
  static bool get isFluent => backend == UiBackend.fluent;
  static bool get isCupertino => backend == UiBackend.cupertino;

  static void ensureInitialized() => WidgetsFlutterBinding.ensureInitialized();
}

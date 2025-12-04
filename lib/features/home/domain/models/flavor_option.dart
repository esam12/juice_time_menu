import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor.dart';
import 'package:juice_time_menu/features/home/domain/models/localized_text.dart';

part 'flavor_option.freezed.dart';
part 'flavor_option.g.dart';

/// Immutable domain model representing a flavor option group.
/// Supports single or multiple selection with min/max constraints.
@freezed
abstract class FlavorOption with _$FlavorOption {
  const factory FlavorOption({
    required String id,
    required LocalizedText label,
    required List<Flavor> flavors,
    @Default('custom') String type,
    @Default('single') String selectionType,
    @Default(1) int minSelection,
    @Default(1) int maxSelection,
    @Default(false) bool isRequired,
  }) = _FlavorOption;

  const FlavorOption._();

  factory FlavorOption.fromJson(Map<String, dynamic> json) =>
      _$FlavorOptionFromJson(json);

  /// Returns true if selection type is single.
  bool get isSingleSelection => selectionType == 'single';

  /// Returns true if selection type is multiple.
  bool get isMultipleSelection => selectionType == 'multiple';
}

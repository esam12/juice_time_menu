import 'package:juice_time_menu/features/home/data/models/flavor.dart';
import 'package:juice_time_menu/features/home/data/models/localize_text.dart';

class FlavorOption {
  final String id;
  final LocalizedText label;
  final List<Flavor> flavors;

  final String type;

  final String selectionType;

  final int minSelection;
  final int maxSelection;


  final bool isRequired;

  const FlavorOption({
    required this.id,
    required this.label,
    required this.flavors,
    this.type = 'custom',
    this.selectionType = 'single',
    this.minSelection = 1,
    this.maxSelection = 1,
    this.isRequired = false,
  });

  factory FlavorOption.fromJson(Map<String, dynamic> json) {
    return FlavorOption(
      id: json['id'].toString(),
      label: LocalizedText.fromJson(json['label']),
      flavors: (json['flavors'] as List)
          .map((e) => Flavor.fromJson(e))
          .toList(),
      type: json['type'] ?? 'custom',
      selectionType: json['selectionType'] ?? 'single',
      minSelection: json['minSelection'] ?? 1,
      maxSelection: json['maxSelection'] ?? 1,
      isRequired: json['isRequired'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label.toJson(),
        'flavors': flavors.map((e) => e.toJson()).toList(),
        'type': type,
        'selectionType': selectionType,
        'minSelection': minSelection,
        'maxSelection': maxSelection,
        'isRequired': isRequired,
      };
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlavorOption _$FlavorOptionFromJson(Map<String, dynamic> json) =>
    _FlavorOption(
      id: json['id'] as String,
      label: LocalizedText.fromJson(json['label'] as Map<String, dynamic>),
      flavors: (json['flavors'] as List<dynamic>)
          .map((e) => Flavor.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String? ?? 'custom',
      selectionType: json['selectionType'] as String? ?? 'single',
      minSelection: (json['minSelection'] as num?)?.toInt() ?? 1,
      maxSelection: (json['maxSelection'] as num?)?.toInt() ?? 1,
      isRequired: json['isRequired'] as bool? ?? false,
    );

Map<String, dynamic> _$FlavorOptionToJson(_FlavorOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'flavors': instance.flavors,
      'type': instance.type,
      'selectionType': instance.selectionType,
      'minSelection': instance.minSelection,
      'maxSelection': instance.maxSelection,
      'isRequired': instance.isRequired,
    };

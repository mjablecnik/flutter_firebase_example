import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable(nullable: false)
class Item {

  String id;
  String name;
  String description = "";
  DateTime created = DateTime.now();
  DateTime lastChange = DateTime.now();

  Item(this.name);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
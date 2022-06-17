import 'package:json_annotation/json_annotation.dart';

part 'number_facts.g.dart';

@JsonSerializable()
class NumberFacts {
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'number')
  int? number;
  @JsonKey(name: 'found')
  bool? found;
  @JsonKey(name: 'type')
  String? type;

  NumberFacts({this.text, this.number, this.found, this.type});

  factory NumberFacts.fromJson(Map<String, dynamic> json) {
    return _$NumberFactsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberFactsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

// terminal command for JsonSerializableGenerator : dart run build_runner build
@JsonSerializable(explicitToJson: true)
class Store {
  String name;
  String address;
  String stock;
  int type;


  Store({
    required this.address,
    required this.name,
    required this.stock,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  String toString() {
    return 'Store{name: $name, address: $address, stock: $stock, type: $type}';
  }
}

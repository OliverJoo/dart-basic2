import 'dart:convert';

import "package:http/http.dart" as http;
import 'dart:io';

class MaskStores {
  num? count;
  List<Stores>? stores;

  MaskStores({
    this.count,
    this.stores,
  });

  MaskStores.fromJson(dynamic json) {
    count = json['count'];
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores?.add(Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (stores != null) {
      map['stores'] = stores?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'MaskStores{count: $count, stores: $stores}';
  }
}

class Stores {
  String? addr;
  String? code;
  String? createdAt;
  num? lat;
  num? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  Stores({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });

  Stores.fromJson(dynamic json) {
    addr = json['addr'];
    code = json['code'];
    createdAt = json['created_at'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    remainStat = json['remain_stat'];
    stockAt = json['stock_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addr'] = addr;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['remain_stat'] = remainStat;
    map['stock_at'] = stockAt;
    map['type'] = type;
    return map;
  }

  @override
  String toString() {
    return 'Stores{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type}';
  }
}

void main() async {
  try {
    final mask = MaskStores.fromJson(await getMaskStoresInfo());
    final maskList = <Stores>[];
    mask.stores?.forEach((e) {
      if (e.code != null &&
          e.createdAt != null &&
          e.addr != null &&
          e.type != null &&
          e.stockAt != null &&
          e.remainStat != null &&
          e.lng != null &&
          e.lat != null &&
          e.name != null) {
        maskList.add(e);
      }
    });
    print(maskList.toString());
    print(maskList.length);
  } catch (e) {
    print(e.toString());
  }
}

Future<Map<String, dynamic>> getMaskStoresInfo() async {
  final response = await http.get(Uri.parse('http://104.198.248.76:3000/mask'));

  if (response.statusCode == HttpStatus.ok) {
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load Movie Information');
  }
}

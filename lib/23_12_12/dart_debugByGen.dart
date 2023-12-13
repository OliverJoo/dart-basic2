import 'dart:convert';

class Data {
  List<CollectionChartDataList>? collectionChartDataList;

  Data({
    this.collectionChartDataList,
  });

  Data.fromJson(dynamic json) {
    if (json['collectionChartDataList'] != null) {
      collectionChartDataList = [];
      json['collectionChartDataList'].forEach((v) {
        collectionChartDataList?.add(CollectionChartDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (collectionChartDataList != null) {
      map['collectionChartDataList'] =
          collectionChartDataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'Data{collectionChartDataList: $collectionChartDataList}';
  }
}

class CollectionChartDataList {
  String? collectionName;
  dynamic collectionSalePrice;

  CollectionChartDataList({
    this.collectionName,
    this.collectionSalePrice,
  });

  CollectionChartDataList.fromJson(dynamic json) {
    collectionName = json['collectionName'];
    collectionSalePrice = json['collectionSalePrice'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionName'] = collectionName;
    map['collectionSalePrice'] = collectionSalePrice;
    return map;
  }

  @override
  String toString() {
    return 'CollectionChartDataList{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}

void main() {
  final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';

  final data = Data.fromJson(jsonDecode(json));
  print(data);
}

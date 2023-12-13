import 'dart:convert';

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'cvtDatetime': cvtDatetime,
    };
  }

  factory CollectionSalePrice.fromMap(Map<String, dynamic> map) {
    return CollectionSalePrice(
      price: map['price'] as double,
      cvtDatetime: map['cvtDatetime'] as DateTime,
    );
  }

  @override
  String toString() {
    return 'CollectionSalePrice{price: $price, dateTime: $cvtDatetime}';
  }
}

class ChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  ChartData({
    required this.collectionName,
    this.collectionSalePrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice,
    };
  }

  factory ChartData.fromMap(Map<String, dynamic> map) {
    final collectionSalePrice = map['collectionSalePrice'] as List<dynamic>;
    return ChartData(
      collectionName: map['collectionName'] ?? 'collectionName',
      collectionSalePrice: collectionSalePrice != null
          ? collectionSalePrice
              .map((collectionSalePrice) => CollectionSalePrice.fromMap(
                  collectionSalePrice as Map<String, dynamic>))
              .toList()
          : <CollectionSalePrice>[],
    );
  }

  @override
  String toString() {
    return 'ChartData{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}

class CollectionChartData {
  List<dynamic> chartData;

  CollectionChartData({
    required this.chartData,
  });

  Map<String, dynamic> toMap() {
    return {
      'chartData': chartData,
    };
  }

  factory CollectionChartData.fromMap(Map<String, dynamic> map) {
    final chartData = map['collectionChartDataList'] as List<dynamic>;
    return CollectionChartData(
      chartData: chartData != null
          ? chartData.map((chartData) => ChartData.fromMap(chartData as Map<String, dynamic>)).toList()
          : <ChartData>[],
    );
  }

  @override
  String toString() {
    return 'CollectionChartData{chartData: $chartData}';
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

  final Map<String, dynamic> jsonData = jsonDecode(json);
  print('$jsonData\n');
  // for (var value in jsonData.entries) {
  //   print(val ue);
  // }

  // final chartData = ChartData.fromMap(jsonData);
  final chartData = CollectionChartData.fromMap(jsonData);
  print(chartData);
}

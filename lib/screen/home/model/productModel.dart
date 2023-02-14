import 'dart:convert';

class CasesModel {
  final String status;
  final String message;
  final List<ProductModel> productList;

  CasesModel( {
    required this.status,
    required this.message,
    required this.productList,
  });

  factory CasesModel.fromRawJson(dynamic str) {
    print(str);
    return CasesModel.fromJson(json.decode(str) as Map<String, dynamic>);
  }


  String toRawJson() => json.encode(toJson());

  factory CasesModel.fromJson(Map<String, dynamic> json) {
   return CasesModel(
      status: json["status"] as String,
      message: json["message"] as String,
      productList: json["data"]==null?[]:List<ProductModel>.from(
        (json["data"]).map(
              (x) => ProductModel.fromJson(x as Map<String, dynamic>),
        ),
      ).reversed.toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(productList.map((x) => x.toJson())),
      };
}

class ProductModel {
  String? pid;
  String? pname;
  String? qty;
  String? price;
  String? addedDatetime;

  ProductModel(
      {this.pid, this.pname, this.qty, this.price, this.addedDatetime});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pname = json['pname'];
    qty = json['qty'];
    price = json['price'];
    addedDatetime = json['added_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['pname'] = this.pname;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['added_datetime'] = this.addedDatetime;
    return data;
  }
}

class rto_model {
  int? id;
  String? code;
  String? name;
  List<Detail>? detail;

  rto_model({this.id, this.code, this.name, this.detail});

  rto_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  int? id;
  String? state;
  String? cityName;
  String? rtoAddress;
  String? rtoPhone;
  String? rtoUrl;
  String? rtoCode;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Detail(
      {this.id,
        this.state,
        this.cityName,
        this.rtoAddress,
        this.rtoPhone,
        this.rtoUrl,
        this.rtoCode,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    cityName = json['city_name'];
    rtoAddress = json['rto_address'];
    rtoPhone = json['rto_phone'];
    rtoUrl = json['rto_url'];
    rtoCode = json['rto_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['city_name'] = this.cityName;
    data['rto_address'] = this.rtoAddress;
    data['rto_phone'] = this.rtoPhone;
    data['rto_url'] = this.rtoUrl;
    data['rto_code'] = this.rtoCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

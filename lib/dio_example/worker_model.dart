// Worker model
class Worker {
  int? id;
  int? serviceId;
  String? name;
  String? tel1;
  String? tel2;
  String? address;
  String? places;
  dynamic profile;
  String? services;
  double? rate;

  Worker({
    this.id,
    this.serviceId,
    this.name,
    this.tel1,
    this.tel2,
    this.address,
    this.places,
    this.profile,
    this.services,
    this.rate,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        id: json['id'] as int?,
        serviceId: json['serviceID'] as int?,
        name: json['name'] as String?,
        tel1: json['tel1'] as String?,
        tel2: json['tel2'] as String?,
        address: json['address'] as String?,
        places: json['places'] as String? ?? "",
        profile: json['profile'] as dynamic ?? "",
        services: json['services'] as String?,
        rate: json['rate'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceID': serviceId,
        'name': name,
        'tel1': tel1,
        'tel2': tel2,
        'address': address,
        'places': places,
        'profile': profile,
        'services': services,
        'rate': rate,
      };
}

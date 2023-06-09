import 'dart:convert';

class Auctions {
  final int? id;
  final String? name;
  final String? time;
  final String? date;
  final String? city;
  final String? image;
  final String? deskOne;
  final String? address;
  final String? local;

  const Auctions({
    this.id,
    this.name,
    this.time,
    this.date,
    this.city,
    this.image,
    this.deskOne,
    this.address,
    this.local,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'time': time,
      'date': date,
      'city': city,
      'image': image,
      'desk_one': deskOne,
      'address': address,
      'local': local,
    };
  }

  factory Auctions.fromMap(Map<String, dynamic> map) {
    return Auctions(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      deskOne: map['desk_one'] != null ? map['desk_one'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      local: map['local'] != null ? map['local'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auctions.fromJson(String source) =>
      Auctions.fromMap(json.decode(source) as Map<String, dynamic>);
}

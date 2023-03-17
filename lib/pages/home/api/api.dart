
import 'dart:convert';
import '../models/home_models.dart';
import 'package:http/http.dart' as http;

Future<List<Auctions>> responseApi() async {
    var header = {
      'app': 'ee85db5d-ebec-4548-a62b-ae8c68955d31',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json'
    };

    var request = Uri.parse(
      'https://bis365.com.br/bid365/api/v1/auctions',
    );
    final response = await http.get(
      request,
      headers: header,
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonBody = jsonDecode(response.body)['data'];
        print(jsonBody);
        List<Auctions> auctions = [];

        jsonBody.forEach((data) {
          var auction = Auctions(
            id: data['id'],
            name: data['name'],
            time: data['time'],
            date: data['date'],
            city: data['city'],
            image: data['image'],
            deskOne: data['desk_one'],
          );

          // print("Auction: ${auction.toJson()}");
          auctions.add(auction);
        });

        return auctions;
      } catch (e) {
        throw e;
      }
    } else {
      throw Exception('Falha ao conectar');
    }
  }
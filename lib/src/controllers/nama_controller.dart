import 'dart:convert';
import 'package:flutter/foundation.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../models/nama_model.dart';

List<Nama> parseCharacter(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var characters = list.map((e) => Nama.fromJson(e)).toList();
  return characters;
}

Future<List<Nama>> fetchCharacters() async {

  //final String jsonString = await rootBundle.loadString('assets/data.json');
  //return compute(parseCharacter, jsonString);

  final http.Response response = await http.get(Uri.parse('https://api.npoint.io/6a4ace301086af61394e'));
  if (response.statusCode == 200) {
    return compute(parseCharacter, response.body);
  } else {
    throw Exception(response.statusCode);
  }

}
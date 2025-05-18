import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/nama_model.dart';

List<Nama> parseCharacter(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var characters = list.map((e) => Nama.fromJson(e)).toList();
  return characters;
}

Future<List<Nama>> fetchCharacters() async {
  final String jsonString = await rootBundle.loadString('data.json');
  return compute(parseCharacter, jsonString);
}
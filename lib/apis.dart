import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:number_facts/number_facts/number_facts.dart';

Future<NumberFacts> getNumberFacts({required int number}) async {
  final response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final _bodyasjson = await jsonDecode(response.body) as Map<String, dynamic>;
  final _data = NumberFacts.fromJson(_bodyasjson);
  return _data;
  print(response.body);
}

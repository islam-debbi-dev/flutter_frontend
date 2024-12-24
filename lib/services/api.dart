import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/person_model.dart';

class Api {
  static const String baseUrl = 'http://192.168.1.34:3000/api/';

  static addPerson(Map pdata) async {
    print(pdata);
    //Uri.parse('$baseUrl/posts')
    var url = Uri.parse(baseUrl + "newuser");
    try {
      final res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        print('Success');
      } else {
        print('Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get data
  static Future<List<PersonModel>> getPerson() async {
    List<PersonModel> person = [];
    var url = Uri.parse(baseUrl + "users");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        data['person'].forEach((element) => {
              person.add(PersonModel(
                name: element['name'],
                email: element['email'],
                password: element['password'],
                age: int.parse(element['age']),
                id: int.parse(element['id']),
              ))
            });
        print(person);
        return person;
      } else {
        print('Failed');
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static updatePerson(id, body1) async {
    var url = Uri.parse(baseUrl + "updateuser/$id");
    try {
      final res = await http.put(url, body: body1);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
        print('Success update');
      } else {
        print('Failed to load DATA !');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

// update person

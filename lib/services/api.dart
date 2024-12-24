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
                age: element['age'],
                id: element['id'],
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

  static Future<void> updatePerson(String id, Map<String, String> pdata) async {
    var url = Uri.parse(baseUrl + "updateuser/$id");
    try {
      final res = await http.put(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        print('Update Success');
      } else {
        print('Update Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // delete method for delete data
  static Future<void> deletePerson(id) async {
    var url = Uri.parse(baseUrl + "deleteuser/$id");
    try {
      final res = await http.delete(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        print('Delete Success');
      } else {
        print('Delete Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

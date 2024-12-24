import 'package:flutter/material.dart';
import 'package:frontend/delete_data.dart';
import 'package:frontend/home_page.dart';
import 'package:frontend/create.dart';
import 'package:frontend/update_data.dart';
import 'package:frontend/edite_screen.dart';

import 'display_data.dart';
import 'models/person_model.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomePage(),
  '/create': (context) => Create(),
  '/display': (context) => DisplayData(),
  '/update': (context) => UpdateData(),
  '/edit': (context) => EditeScreen(
      data: ModalRoute.of(context)!.settings.arguments as PersonModel),
  '/delete': (context) => DeleteData(),
};

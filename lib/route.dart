import 'package:flutter/material.dart';
import 'package:frontend/home_page.dart';
import 'package:frontend/create.dart';

import 'display_data.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomePage(),
  '/create': (context) => Create(),
  '/display': (context) => DisplayData(),
};

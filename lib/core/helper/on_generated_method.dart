import 'package:flutter/material.dart';

MaterialPageRoute onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splash_view':
      return MaterialPageRoute(builder: (context) => Container());

    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}

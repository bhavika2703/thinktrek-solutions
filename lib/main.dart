import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';

void main() {
  // Path URLs (`/about`) instead of hash URLs (`/#/about`) so web routes
  // match the browser address bar.
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ThinkTrekApp());
}

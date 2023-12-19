import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_module/my_app.dart';
import 'package:flutter_module/my_app_event.dart';
import 'package:flutter_module/my_app_method.dart';

void main() {
  runApp(const MyApp());
}

void entryPointA() {
  runApp(MyApp());
}

void entryPointB() {
  runApp(MyAppEvent());
}

void entryPointC() {
  runApp(MyAppMethod());
}


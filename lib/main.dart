import 'package:flutter/material.dart';
import 'package:idm/temperatura.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.red),
    home: Temperatura(),
    debugShowCheckedModeBanner: false,
  ));
}
import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'accessibility_new': Icons.accessibility_new,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'input': Icons.input,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}

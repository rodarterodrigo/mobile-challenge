import 'package:flutter/material.dart';

abstract class INavigation {
  Widget viewList(int index, String search);
  List<BottomNavigationBarItem> bottonNavigation();
}

class Navigation implements INavigation {
  @override
  Widget viewList(int index, String search) {
    List<Widget> views = [
      null,
      null,
      null,
    ];
    return views[index];
  }

  @override
  List<BottomNavigationBarItem> bottonNavigation() => [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      label: "Início",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.yellow,
      label: "Busca",
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      label: "Biblioteca",
      icon: Icon(Icons.photo_library),
    ),
  ];
}
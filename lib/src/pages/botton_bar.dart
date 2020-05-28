/* import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  final int actual;
    final Function(int) controlClick;

     BottomBarWidget({Key key, @required this.controlClick, @required this.actual}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            backgroundColor: Colors.lightBlue[50],
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
            unselectedItemColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.black),
            currentIndex: actual,
            onTap: onTabTapped, 
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text("Categorias"), ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("Busqueda")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check), title: Text("Tips")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text("Perfil")),
            ]);
  }

  void onTabTapped(int index){
    setState(() {
      seleccionado = index;
    });
  }
}

 */


import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {

  final int actual;
  final Function(int) controlClick;

  BottomBarWidget({Key key,  this.actual, @required this.controlClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          selectedIconTheme: IconThemeData(color: Colors.purple),
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.black),
          currentIndex: actual,
          onTap: (index) {
           controlClick(index);
          },
          items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text("Mascota"), ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("Busqueda")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check), title: Text("Tips")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text("Perfil")),
          ]);

  }
}
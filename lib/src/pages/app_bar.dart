
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        
        backgroundColor: Colors.lightBlue[50],        
        leading: Padding(padding: const EdgeInsets.all(8.0),
          child:_logo("images/logo.png"),),
        centerTitle: true,
        title: Image.asset('images/nombre.png', ),
      );
  }

  Widget _logo(String logo) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
         image: DecorationImage(
          fit:BoxFit.fill,
          image: AssetImage(logo)
        ) 
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
  
}
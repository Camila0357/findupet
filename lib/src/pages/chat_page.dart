import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/chat_screen.dart';

class ChatPage extends StatelessWidget {
  State createState() => new ChatScreenState();
  @override
  Widget build(BuildContext context) {
    int seleccionado=0; 
    return new Scaffold(
        appBar: AppBar(
        
        backgroundColor: Colors.lightBlue[50],leading: Padding(padding: const EdgeInsets.all(8.0),
          child:_logo("images/logo.png"),),
        centerTitle: true,
        title: Image.asset('images/nombre.png', ),
      ),

       
        body: new ChatScreen(),
        
        
         bottomNavigationBar: new Theme(
       data: Theme.of(context).copyWith(
      
        canvasColor: Colors.lightBlue[50],
        ),
       child: BottomNavigationBar(
          backgroundColor: Colors.lightBlue[50],
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color:Colors.black),
          currentIndex: seleccionado,
          onTap: (index){
            
            
            
            /* setState(() {
              seleccionado=index;
            }); */
            
            
            print(seleccionado);},
          
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categorias")),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Busqueda")),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.check), title: Text("Tips")),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("Perfil")),
          ]),
    ),
        
        );

        
  }
 Widget _logo(String logo) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(logo))),
    );
  }
   
}
import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/mascota_page.dart';
import 'package:formvalidation/src/pages/register_page.dart';
import './src/bloc/provider.dart';
import './src/pages/home_page.dart';
import './src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'mascota',//recordar cambiar a Login
        routes: {
          'login' : ( BuildContext context ) => LoginPage(),
          'home'  : ( BuildContext context ) => HomePage(),
          'register': (BuildContext context ) => RegisterPage(),
          'mascota' : (BuildContext context) => MascotaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.indigo[800],
        ),
      ),
    );
      
  }
}
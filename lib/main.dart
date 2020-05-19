import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/mascota_page.dart';
import 'package:formvalidation/src/pages/register_page.dart';
import 'package:formvalidation/src/pages/chat_page.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import './src/bloc/provider.dart';
import './src/pages/home_page.dart';
import './src/pages/login_page.dart';
 
void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();  
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  //MyApp.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

    print(prefs.token);    

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',//recordar cambiar a Login
        routes: {
          'login' : ( BuildContext context ) => LoginPage(),
          'home'  : ( BuildContext context ) => HomePage(),
          'registro': (BuildContext context ) => RegisterPage(),
          'mascota' : (BuildContext context) => MascotaPage(),
           'chat' : (BuildContext context) => ChatPage()
        },
        theme: ThemeData(
          primaryColor: Colors.indigo[800],
        ),
      ),
    );
      
  }
}
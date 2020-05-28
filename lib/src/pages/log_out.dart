/* import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';
import '../bloc/provider.dart';
import 'app_bar.dart';
import 'botton_bar.dart';


class LogOutPage extends StatelessWidget {


  @override
  
  Widget build(BuildContext context){
                final bloc = Provider.of(context);
                final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(),
      resizeToAvoidBottomPadding: false,
      body:Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
            image: new AssetImage("images/fondo.jpg"),
            fit: BoxFit.cover
            ),

          ),

          child: Column(
            children:<Widget>[
              new Container(
                padding: EdgeInsets.only(top: 58.0),
                child: new Image(
                  width: 410,
                  height: 410, 
                  image: new AssetImage("images/logo.jpg"),
                ),

              ),
             Container(                    
            child: Column(
              children: <Widget>[                
                SizedBox(height: 20.0),
                _crearBoton(bloc),                               
              ],
            ),
          ),
            ]
          ),
          )
          ),
         /*  bottomNavigationBar: BottomBarWidget(
        actual: _seleccionado,
        controlClick: (index){
          setState(() {
            _seleccionado = index;
          });
        },
        ), */


    );
  }

  Widget _crearBoton(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 125.0, vertical: 20.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 0.0,
            color: Colors.indigo[800],
            textColor: Colors.white,
            onPressed: (){print("oprimi iniciar receta");
            Navigator.pushNamed(context, 'login');
            });
      },
    );
  }

}
 */

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

import 'app_bar.dart';
import 'botton_bar.dart';

class LogOutPage extends StatefulWidget {
  LogOutPage({Key key}) : super(key: key);

  @override
  _LogOutPageState createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {

 int _seleccionado = 4;

  @override
   Widget build(BuildContext context){
                final bloc = Provider.of(context);
                final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(),
      resizeToAvoidBottomPadding: false,
      body:Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
            image: new AssetImage("images/fondo.jpg"),
            fit: BoxFit.cover
            ),

          ),

          child: Column(
            children:<Widget>[
              new Container(
                padding: EdgeInsets.only(top: 58.0),
                child: new Image(
                  width: 410,
                  height: 410, 
                  image: new AssetImage("images/logo.jpg"),
                ),

              ),
             Container(                    
            child: Column(
              children: <Widget>[                
                SizedBox(height: 20.0),
                _crearBoton(bloc),                               
              ],
            ),
          ),
            ]
          ),
          )
          ),
        bottomNavigationBar: BottomBarWidget(
        actual: _seleccionado,
        controlClick: (index){
          setState(() {
            _seleccionado = index;
          });
        },
        ), 


    );
  }

  Widget _crearBoton(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 125.0, vertical: 20.0),
              child: Text('Salir'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 0.0,
            color: Colors.indigo[800],
            textColor: Colors.white,
            onPressed: (){print("oprimi iniciar receta");
            Navigator.pushNamed(context, 'login');
            });
      },
    );
  }
}
import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';
import '../bloc/provider.dart';


class LoginPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context){
                final bloc = Provider.of(context);
                final size = MediaQuery.of(context).size;
    return Scaffold(
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
                
                //backgroundColor(Color(0xF81F7F3))
                child: new Image(
                  width: 410,
                  height: 410, 
                  image: new AssetImage("images/logo.jpg"),
                ),

              ),
             Container(
                    
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                _crearEmail(bloc),
                SizedBox(height: 10.0),
                _crearPassword(bloc),
                SizedBox(height: 20.0),
                _crearBoton(bloc),
                new FlatButton(
                  child: new Text('Registrate'),
                  onPressed: moveToRegister,
                )                 
              ],
            ),
          ),
            ]
          ),
          )
          )


    );
  }
  /* Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  } */

  Widget _loginForm(BuildContext context) {
    // Llama el loginbloc hasta encontrar una instancia del provider y de ahi se saca el loginBloc, trabajndo con esa instancia
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 60.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),            
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                _crearEmail(bloc),
                SizedBox(height: 10.0),
                _crearPassword(bloc),
                SizedBox(height: 20.0),
                _crearBoton(bloc),
                new FlatButton(
                  child: new Text('Registrate'),
                  onPressed: moveToRegister,
                )                 
              ],
            ),
          ),

          /* Text('¿Olvidó la contraseña?'),          
          SizedBox( height: 1000.0 ) */
        ],
      ),
    );
  }

  void moveToRegister() {}

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width/1.2,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow:[
              BoxShadow(color: Colors.indigo,
              blurRadius:5)
            ]
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.indigo[800]),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',            
                errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
           width: MediaQuery.of(context).size.width/1.2,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow:[
              BoxShadow(color: Colors.indigo,
              blurRadius:5)
            ]
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.indigo[800]),
                labelText: 'Contraseña',                
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
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
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('================');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('================');

    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final fondo = Container(
      child: Image(
        image: AssetImage('images/login.jpg'),
        fit: BoxFit.fill,
      ),
    );

    return Stack(
      children: <Widget>[
        fondo,
      ],
    );
  }
}

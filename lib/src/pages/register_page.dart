import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';
import '../bloc/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 40.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
         
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 3.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8.0),
                _crearEmail(bloc),
                SizedBox(height: 8.0),
                _crearPassword(bloc),
                SizedBox(height: 8.0),
                _crearNombre(bloc),
                SizedBox(height: 8.0),
                _crearRaza(bloc),
                SizedBox(height: 8.0),
                _crearRol(bloc),
                SizedBox(height: 8.0),
                _crearCiudad(bloc),
                SizedBox(height: 8.0),
                _crearTelefono(bloc),
                SizedBox(height: 15.0),
                _crearBoton(bloc),                               
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
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),
                hintText: 'ejemplo@correo.com',
                labelText: 'REGISTRO',
                /* counterText: snapshot.data, */
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearNombre(LoginBloc bloc) {
    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),            
                labelText: 'Nombre Completo',
                /* counterText: snapshot.data, */
                errorText: snapshot.error),            
          ),
        );
      },
    );
  }

  Widget _crearRaza(LoginBloc bloc) {
    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),            
                labelText: 'Raza',
                counterText: snapshot.data,
                errorText: snapshot.error),            
          ),
        );
      },
    );
  }

  Widget _crearRol(LoginBloc bloc) {
    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),            
                labelText: 'Adoptante o Fundación',
                counterText: snapshot.data,
                errorText: snapshot.error),            
          ),
        );
      },
    );
  }

  Widget _crearCiudad(LoginBloc bloc) {
    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),            
                labelText: 'Ciudad',
                counterText: snapshot.data,
                errorText: snapshot.error),            
          ),
        );
      },
    );
  }

  Widget _crearTelefono(LoginBloc bloc) {
    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                icon: Icon(Icons.star, color: Colors.deepPurple),            
                labelText: 'Telefono',
                counterText: snapshot.data,
                errorText: snapshot.error),            
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
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Regístrate'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.deepPurple,
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
    final fondoModaro = Container(
      child: Image(
        image: AssetImage('images/fondo.jpg'),
        fit: BoxFit.fill,
      ),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
      ],
    );
  }
}

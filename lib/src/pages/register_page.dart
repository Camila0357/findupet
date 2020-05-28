import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/usuario_provider.dart';
import 'package:formvalidation/src/utils/utils.dart';
import '../bloc/login_bloc.dart';
import '../bloc/provider.dart';

class RegisterPage extends StatelessWidget {

  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("images/fondo.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              _loginForm(context),
            ],
          ),
        ),
      ),
    );

    /* return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    )); */
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 100.0,
            ),
          ),
          Container(
            width: size.width * 0.87,
            height: 580,
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                _crearTitulo(bloc),
                SizedBox(height: 8.0),
                _crearEmail(bloc),
                SizedBox(height: 8.0),
                _crearPassword(bloc),
                SizedBox(height: 8.0),
                _crearNombre(bloc),                
                SizedBox(height: 8.0),
                _crearRol(bloc),
                SizedBox(height: 8.0),
                _crearCiudad(bloc),
                SizedBox(height: 8.0),
                _crearTelefono(bloc),
                SizedBox(height: 50.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          new FlatButton(
                  child: new Text('¿Ya tienes cuenta? Login'),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                ) 
        ],
      ),
    );
  }


  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                // icon: Icon(Icons.star, color: Colors.deepPurple),
                hintText: 'ejemplo@correo.com',
                labelText: 'E-mail',
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
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.supervised_user_circle),
                //icon: Icon(Icons.star, color: Colors.deepPurple),
                labelText: 'Nombre Completo',
                /* counterText: snapshot.data, */
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
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.star),
                //icon: Icon(Icons.star, color: Colors.deepPurple),
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
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.star),
                //icon: Icon(Icons.star, color: Colors.deepPurple),
                labelText: 'Ciudad',
                counterText: snapshot.data,
                errorText: snapshot.error),
          ),
        );
      },
    );
  }

  Widget _crearTitulo(LoginBloc bloc) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 320,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Crear cuenta",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        );
      },
    );
  }

  Widget _crearTelefono(LoginBloc bloc) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.star),
                // icon: Icon(Icons.star, color: Colors.deepPurple),
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
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.star),
                //icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
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
              padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 15.0),
              child: Text('Regístrate'),
            ),
            shape: RoundedRectangleBorder(),
            elevation: 0.0,
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _register(bloc, context) : null);
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje'] );
    }

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

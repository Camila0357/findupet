import 'package:flutter/material.dart';
import 'login_bloc.dart';
export 'login_bloc.dart';

// Manipular los estados de la informacion, Inicializa el login Bloc

class Provider extends InheritedWidget {

  static Provider _instancia;

// Determinar si se necesita ingresar una nueva instancia de la clase o la que ya existe
  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ){
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
}

}
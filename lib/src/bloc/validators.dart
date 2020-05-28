import 'dart:async';



class Validators {

  //se valida el patron que ddebe seguir el email 
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {


      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if ( regExp.hasMatch( email ) ) {
        sink.add( email );
      } else {
        sink.addError('Email no es correcto');
      }

    }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    //Informacion que necesita modificar si hay un error (sink)
    handleData: ( password, sink ) {
      //condicional qeu la contraseña debe tener mas de 2 caracteres
      if ( password.length >= 2 ) {
        sink.add( password );
      } else {
        sink.addError('Más de 2 caracteres por favor');
      }

    }
  );


}

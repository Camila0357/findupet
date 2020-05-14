import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/mascota_model.dart';
import 'package:formvalidation/src/providers/mascotas_provider.dart';
import 'package:image_picker/image_picker.dart';

class MascotaPage extends StatefulWidget {
  @override
  _MascotaPageState createState() => _MascotaPageState();
}

class _MascotaPageState extends State<MascotaPage> {
 
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MascotaModel mascota = new MascotaModel();
  final mascotaProvider = new MascotasProvider();

  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Mascota'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            color: Colors.blue[250],
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), 
            color: Colors.blue[250],
            onPressed: _tomarFoto,
          )
        ],
      ),

      body: SingleChildScrollView(        
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearEdad(),
                _crearRaza(),
                _crearCiudad(),
                _crearDescripcion(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _crearNombre(){
    // Trabaja directamente con un formulario ara ser parte del formulario de arriba
    return TextFormField(
      initialValue: mascota.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      onSaved: (value) => mascota.nombre = value,
      validator: (value){
        if (value.length < 2) {
          return 'Ingrese el nombre de la mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearEdad(){
    return TextFormField(
      initialValue: mascota.edad,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Edad',
      ),
      onSaved: (value) => mascota.edad = value,
      validator: (value){
        if (value.length < 1) {
          return 'Ingrese la edad de la mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearRaza(){
    return TextFormField(
      initialValue: mascota.raza,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Raza',
      ),
      onSaved: (value) => mascota.raza = value,
      validator: (value){
        if (value.length < 2) {
          return 'Ingrese la raza de la mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearCiudad(){
    return TextFormField(
      initialValue: mascota.ciudad,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Ciudad',
      ),
      onSaved: (value) => mascota.ciudad = value,
      validator: (value){
        if (value.length < 2) {
          return 'Ingrese la ciudad de la mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearDescripcion(){
    return TextFormField(
      initialValue: mascota.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Descripción',
      ),
      onSaved: (value) => mascota.descripcion = value,
      validator: (value){
        if (value.length < 6) {
          return 'Ingrese la descripción detallada de la mascota';
        } else {
          return null;
        }
      },
    );
  }

  

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.blue,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async{    

    if (!formKey.currentState.validate()) return;
    
    formKey.currentState.save();

    setState(() {_guardando = true;});

    if (foto != null) {
      mascota.fotoUrl = await mascotaProvider.subirImagen(foto);
    }

    mascotaProvider.crearMascota(mascota);
   
    mostrarSnackbar('Registro exitoso');

    Navigator.pop(context);

  }

  void mostrarSnackbar(String mensaje){

    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);

  }

  Widget _mostrarFoto(){
    if (mascota.fotoUrl != null){
      //return Container();
      return FadeInImage(         
        image: NetworkImage(mascota.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else { 
      if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    foto = await ImagePicker.pickImage(
      source: origen
    );
    if (foto != null ) {
      //Limpieza
      mascota.fotoUrl = null;

    }
    setState(() {});
  }

}

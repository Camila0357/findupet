import 'dart:io';
import 'package:flutter/cupertino.dart';
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
    int seleccionado = 0;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _logo("images/logo.png"),
        ),
        centerTitle: true,
        title: Image.asset('images/nombre.png'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            color: Colors.blue,
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            color: Colors.blue,
            onPressed: _tomarFoto,
          )
        ],
      ),
      /* appBar: AppBar(
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
      ), */

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: 375,
          height: 800,
          decoration: BoxDecoration(
            color: Colors.purple[50],
          ),
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                SizedBox(height: 20.0),
                _crearTitulo(),
                SizedBox(height: 8.0),
                _crearNombre(),
                SizedBox(height: 8.0),
                _crearEdad(),
                SizedBox(height: 8.0),
                _crearRaza(),
                SizedBox(height: 8.0),
                _crearCiudad(),
                SizedBox(height: 8.0),
                _crearDescripcion(),
                SizedBox(height: 8.0),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.lightBlue[50],
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.lightBlue[50],
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
            unselectedItemColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.black),
            currentIndex: seleccionado,
            onTap: (index) {
              setState(() {
                seleccionado = index;
              });

              print(seleccionado);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text("Categorias")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("Busqueda")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check), title: Text("Tips")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text("Perfil")),
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

  Widget _crearNombre() {
    // Trabaja directamente con un formulario ara ser parte del formulario de arriba
    return new Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: mascota.nombre,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: 'Nombre',
          ),
          onSaved: (value) => mascota.nombre = value,
          validator: (value) {
            if (value.length < 2) {
              return 'Ingrese el nombre de la mascota';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearEdad() {
    return new Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: mascota.edad,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: 'Edad',
          ),
          onSaved: (value) => mascota.edad = value,
          validator: (value) {
            if (value.length < 1) {
              return 'Ingrese la edad de la mascota';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearRaza() {
    return new Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: mascota.raza,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: 'Raza',
          ),
          onSaved: (value) => mascota.raza = value,
          validator: (value) {
            if (value.length < 2) {
              return 'Ingrese la raza de la mascota';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearCiudad() {
    return new Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: mascota.ciudad,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: 'Ciudad',
          ),
          onSaved: (value) => mascota.ciudad = value,
          validator: (value) {
            if (value.length < 2) {
              return 'Ingrese la ciudad de la mascota';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearDescripcion() {
    return new Container(
        width: 320,
        height: 125,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: mascota.descripcion,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: 'Descripción',
          ),
          onSaved: (value) => mascota.descripcion = value,
          validator: (value) {
            if (value.length < 6) {
              return 'Ingrese la descripción detallada de la mascota';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearTitulo() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 320,
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Ingrese los datos de la mascota",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 115.0, vertical: 15.0),
        child: Text('Guardar'),
      ),
      color: Colors.deepPurpleAccent,
      textColor: Colors.white,
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (foto != null) {
      mascota.fotoUrl = await mascotaProvider.subirImagen(foto);
    }

    mascotaProvider.crearMascota(mascota);

    mostrarSnackbar('Registro exitoso');
    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget _mostrarFoto() {
    if (mascota.fotoUrl != null) {
      //return Container();
      return FadeInImage(
        image: NetworkImage(mascota.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 250.0,
        fit: BoxFit.contain,
      );
    } else {
      if (foto != null) {
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 250.0,
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
    foto = await ImagePicker.pickImage(source: origen);
    if (foto != null) {
      //Limpieza
      mascota.fotoUrl = null;
    }
    setState(() {});
  }
}

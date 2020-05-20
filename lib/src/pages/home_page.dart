import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formvalidation/src/models/mascota_model.dart';
import 'package:formvalidation/src/providers/mascotas_provider.dart';
import '../bloc/provider.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class HomePage extends StatelessWidget {
  final mascotasProvider = new MascotasProvider();

  @override
  Widget build(BuildContext context) {
    int seleccionado = 0;
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.lightBlue[50],
        
        leading: Padding(padding: const EdgeInsets.all(8.0),
          child:_logo("images/logo.png"),),
        centerTitle: true,
        title: Image.asset('images/nombre.png', ),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
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
              /* setState(() {
              seleccionado=index;
            }); */

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

  Widget _botonCompartir(String text) {
    return FlatButton(
      child: Icon(Icons.share, color:Colors.grey,),
      
      onPressed: () async {
        final ByteData bytes = await rootBundle.load('assets/no-image.png');
        await WcFlutterShare.share(
            sharePopupTitle: 'share',
            text: text,
            fileName: 'no-image.png',
            mimeType: 'image/png',
            bytesOfFile: bytes.buffer.asUint8List());
      },
    );
  }

  Widget _botonChat(BuildContext context) {
    return FlatButton(
        child: Icon(Icons.message,color:Colors.grey),
        
        onPressed: () => Navigator.pushNamed(context, 'chat'));
  }

  Widget _labelBoton(String text, BuildContext context) {
    return Column(children: <Widget>[
      Container(
        
        child: Row(children: <Widget>[
          _botonCompartir(text),
          _botonChat(context),
        ]),
      ),
    ]);
  }

  Widget _texto(String text) {
    return Container(
      width: 320,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Roboto'),
      ),
    );
  }

  Widget _circleImage(String logo) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        
         image: DecorationImage(
          fit:BoxFit.fill,
          image: AssetImage(logo)
        ) 
      ),
    );
  }
  Widget _logo(String logo) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
         image: DecorationImage(
          fit:BoxFit.fill,
          image: AssetImage(logo)
        ) 
      ),
    );
  }

  Widget _nombreFundacion() {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                _circleImage("images/fundacion.png"),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Fundacion huellita de amor",
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )),
      ],
    );
  }

  _crearListado() {
    return FutureBuilder(
        future: mascotasProvider.cargarMascotas(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MascotaModel>> snapshot) {
          if (snapshot.hasData) {
            final mascotas = snapshot.data;

            return ListView.builder(
              itemCount: mascotas.length,
              itemBuilder: (context, i) => _crearItem(context, mascotas[i]),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _crearItem(BuildContext context, MascotaModel mascota) {
    return Card(
      child: Column(
        children: <Widget>[
          _nombreFundacion(),
          (mascota.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(mascota.fotoUrl),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

          /* new  ListTile( */
          _labelBoton('${mascota.nombre} - ${mascota.descripcion}', context),
          _texto('${mascota.nombre} - ${mascota.descripcion}'),

          /* title: Text('${mascota.nombre} - ${mascota.edad} - ${mascota.raza} - ${mascota.ciudad} - ${mascota.descripcion}',
                  style: TextStyle(),),
                  subtitle: Text(mascota.id), */
          /* onTap: () => Navigator.pushNamed(context, 'mascota'), */
          /* ), */
        ],
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.blue[250],
      onPressed: () => Navigator.pushNamed(context, 'mascota'),
    );
  }
}

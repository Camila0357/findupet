import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formvalidation/src/models/mascota_model.dart';
import 'package:formvalidation/src/providers/mascotas_provider.dart';
import '../bloc/provider.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

import 'app_bar.dart';
import 'botton_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mascotasProvider = new MascotasProvider();

  int _seleccionado = 2;

  @override
  Widget build(BuildContext context) {
  
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBarWidget(),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
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

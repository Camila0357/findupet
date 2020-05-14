import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/mascota_model.dart';
import 'package:formvalidation/src/providers/mascotas_provider.dart';
import '../bloc/provider.dart';

class HomePage extends StatelessWidget {

  final mascotasProvider = new MascotasProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: _crearListado(),      
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearListado(){
    return FutureBuilder(
      future: mascotasProvider.cargarMascotas(),
      builder: (BuildContext context, AsyncSnapshot<List<MascotaModel>> snapshot) {
        if (snapshot.hasData) {

          final mascotas = snapshot.data;

          return ListView.builder(
            itemCount: mascotas.length,
            itemBuilder: (context, i) => _crearItem(/* context, */ mascotas[i]),
        );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }


  Widget _crearItem(/* BuildContext context, */ MascotaModel mascota) {

    return Card(
          child: Column(
            children: <Widget>[
              (mascota.fotoUrl == null) 
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage(mascota.fotoUrl),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text('${mascota.nombre} - ${mascota.edad} - ${mascota.raza} - ${mascota.ciudad} - ${mascota.descripcion}'),
                  subtitle: Text(mascota.id),
                  /* onTap: () => Navigator.pushNamed(context, 'mascota'), */
                ),
            ],
          ),
        );
  }


 _crearBoton( BuildContext context) {
   return FloatingActionButton(
     child: Icon(Icons.add),
     backgroundColor: Colors.blue[250],
     onPressed: () => Navigator.pushNamed(context, 'mascota'),
   );
 }

}
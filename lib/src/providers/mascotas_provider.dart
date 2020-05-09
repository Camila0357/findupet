import 'dart:convert';
import 'dart:io';
import 'package:formvalidation/src/models/mascota_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';


class MascotasProvider {

  final String _url = 'https://findupet.firebaseio.com';

  Future<bool> crearMascota(MascotaModel mascota) async {
    final url = '$_url/mascotas.json';

    final resp = await http.post(url, body: mascotaModelToJson(mascota));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<MascotaModel>> cargarMascotas() async {

    final url = '$_url/mascotas.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<MascotaModel> mascotas = new List();

    if (decodedData == null ) return [];

    decodedData.forEach((id, masc){

      final mascTemp = MascotaModel.fromJson(masc);
      mascTemp.id = id;

      mascotas.add(mascTemp);
      
    });

    print(mascotas);
    return mascotas;

  }

  Future<String> subirImagen(File imagen) async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dve79qhf5/image/upload?upload_preset=i1muex6g');
    final mimeType = mime(imagen.path).split('/'); 

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType(mimeType[0], mimeType[1]),
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);

    return respData['secure_url'];


  }


}
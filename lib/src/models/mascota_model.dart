// To parse this JSON data, do
//
//     final mascotaModel = mascotaModelFromJson(jsonString);

import 'dart:convert';

MascotaModel mascotaModelFromJson(String str) => MascotaModel.fromJson(json.decode(str));

String mascotaModelToJson(MascotaModel data) => json.encode(data.toJson());

class MascotaModel {
    String id;
    String nombre;
    String edad;
    String raza;
    String ciudad;
    String descripcion;
    String fotoUrl;

    MascotaModel({
        this.id,
        this.nombre = '',
        this.edad = '',
        this.raza = '',
        this.ciudad = '',
        this.descripcion = '',
        this.fotoUrl,
    });

//Recibe un mapa por el cual se le asigna el valor a cada una de sus propiedades
    factory MascotaModel.fromJson(Map<String, dynamic> json) => new MascotaModel(
        id          : json["id"],
        nombre      : json["nombre"],
        edad        : json["edad"],
        raza        : json["raza"],
        ciudad      : json["ciudad"],
        descripcion : json["descripcion"],
        fotoUrl     : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"         : id,
        "nombre"     : nombre,
        "edad"       : edad,
        "raza"       : raza,
        "ciudad"     : ciudad,
        "descripcion": descripcion,
        "fotoUrl"    : fotoUrl,
    };
}

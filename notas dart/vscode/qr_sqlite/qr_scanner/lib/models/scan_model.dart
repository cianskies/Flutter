import 'dart:convert';
ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    int? id;
    String? tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
        
    }){
      if ( this.valor.contains( 'http' ) ){
        this.tipo = 'http';
      }else{
        this.tipo = 'geo';
      }
      print(this.tipo);
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
  String? docId;
  String? name;
  String? harga;

  MenuModel({this.docId, this.name, this.harga});

  MenuModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    harga = data["harga"];
  }
}

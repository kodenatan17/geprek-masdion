import 'package:cloud_firestore/cloud_firestore.dart';

class PelangganModel {
  String? docId;
  String? name;
  String? phone;

  PelangganModel({this.docId, this.name, this.phone});

  PelangganModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    phone = data["phone"];
  }
}

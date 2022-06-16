import 'package:equatable/equatable.dart';

import 'package:dro/core/app_export.dart';

/// Simulate a data model
List<Suggestions> suggestionsData = [
  Suggestions(
      title: 'Paracetamol',
      imageUri: AssetsImages.paracetamol,
      drugType: 'Tablet',
      weight: '500',
      price: '350.00',
      qty: '1',
      requiresPrescription: false),
  Suggestions(
      title: 'Doliprane',
      imageUri: AssetsImages.doliPrane,
      drugType: 'Capsule',
      weight: '1000',
      price: '400.00',
      qty: '1',
      requiresPrescription: true),
  Suggestions(
      title: 'Paracetamol',
      imageUri: AssetsImages.paracetamol2,
      drugType: 'Tablet',
      weight: '500',
      price: '450.00',
      qty: '1',
      requiresPrescription: true),
  Suggestions(
      title: 'Ibuprofen',
      imageUri: AssetsImages.ibuProfen,
      drugType: 'Tablet',
      weight: '200',
      price: '500.00',
      qty: '1',
      requiresPrescription: false),
  Suggestions(
      title: 'Panadol',
      imageUri: AssetsImages.panadol,
      drugType: 'Tablet',
      weight: '500',
      price: '550.00',
      qty: '1',
      requiresPrescription: false),
  Suggestions(
      title: 'Ibuprofen',
      imageUri: AssetsImages.ibuProfen2,
      drugType: 'Tablet',
      weight: '400',
      price: '600.00',
      qty: '1',
      requiresPrescription: false),
  ];

//data model
// ignore: must_be_immutable
class Suggestions extends Equatable {
  String title = '';
  String imageUri = '';
  String drugType = '';
  String weight = '';
  String price = '';
  String qty = '1';
  bool requiresPrescription = false;

  Suggestions(
      {required this.title,
      required this.imageUri,
      required this.drugType,
      required this.weight,
      required this.price,
      required this.qty,
      required this.requiresPrescription});

  Suggestions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUri = json['imageUri'];
    drugType = json['drugType'];
    weight = json['weight'];
    price = json['price'];
    qty = json['qty'];
    requiresPrescription = json['requiresPrescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imageUri'] = imageUri;
    data['drugType'] = drugType;
    data['weight'] = weight;
    data['price'] = price;
    data['qty'] = qty;
    data['requiresPrescription'] = requiresPrescription;
    return data;
  }

  @override
  List<Object?> get props => [title, imageUri, drugType, weight, price, qty, requiresPrescription];
}

import 'package:dro/data/data_export.dart';

class Item extends Equatable {
  const Item(this.title, this.imageUri, this.drugType, this.weight, this.price, this.qty);

  final String title;
  final String imageUri;
  final String drugType;
  final String weight;
  final String price;
  final String qty;
  final bool requiresPrescription = false;

  @override
  List<Object> get props => [title, imageUri, drugType, weight, price, qty, requiresPrescription];
}

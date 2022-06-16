import 'package:dro/data/data_export.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Suggestions>[]});

  final List<Suggestions> items;

  double get totalPrice {
    return items.fold(
        0, (total, current) => total + (double.parse(current.price) * double.parse(current.qty)));
  }

  @override
  List<Object> get props => [items];
}

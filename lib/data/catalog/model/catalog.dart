import 'package:dro/data/data_export.dart';

class Catalog extends Equatable {
  const Catalog({required this.itemNames});

  final List<Suggestions> itemNames;

  Item getById(int id) => Item(
        itemNames[id].title,
        itemNames[id].imageUri,
        itemNames[id].drugType,
        itemNames[id].weight,
        itemNames[id].price,
        itemNames[id].qty
      );

  Item getByPosition(int position) => getById(position);

  @override
  List<Object> get props => [itemNames];
}

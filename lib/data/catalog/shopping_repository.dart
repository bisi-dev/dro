import 'package:dro/data/data_export.dart';
import 'package:dro/core/app_export.dart';

const _delay = Duration(milliseconds: 800);

final _catalog = suggestionsData;

class ShoppingRepository {
  final _items = <Suggestions>[];

  Future<List<Suggestions>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Suggestions>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Suggestions item) => _items.add(item);

  void removeItemFromCart(Suggestions item) => _items.remove(item);
}

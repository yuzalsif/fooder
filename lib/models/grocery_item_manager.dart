import 'package:flutter/foundation.dart';
import 'models.dart';

class GroceryItemManager extends ChangeNotifier {
  final _groceryItems = <GroceryItem>[];
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void updateItem(GroceryItem item) {
    // final int _item = _groceryItems.indexOf(item);
    // _groceryItems[_item] = item;

    for (int i = 0; i < _groceryItems.length; i++) {
      GroceryItem _item = _groceryItems.elementAt(i);

      if (_item.id == item.id) {
        _groceryItems[i] = item;
        break;
      }
    }

    // _groceryItems = _groceryItems.map((GroceryItem _item) {
    //   if (_item.id == item.id) {
    //     return item;
    //   }
    //   return _item;
    // }).toList().cast<GroceryItem>();

    notifyListeners();
  }

  void completed(int index, bool change) {
    final item = groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}

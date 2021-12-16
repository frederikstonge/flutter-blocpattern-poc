import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<LineItem>> {
  CartCubit() : super([]);

  void addItem(String productId, int quantity) {
    var items = List.of(state);
    items.add(LineItem(productId, quantity));
    emit(items);
  }

  void refresh() {
    var items = List.of(state);
    emit(items);
  }
}

class LineItem {
  String productId;
  int quantity;

  LineItem(this.productId, this.quantity);
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartItem extends StatefulWidget {
  final String productId;
  final int? quantity;
  final Function(int quantity) onSubmit;
  final bool editMode;
  const CartItem(this.productId, this.onSubmit,
      {Key? key, this.quantity = 1, this.editMode = false})
      : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int? quantity;

  @override
  void initState() {
    quantity = widget.quantity ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.quantity.toString(),
              decoration: const InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) => setState(() {
                quantity = int.tryParse(value);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed:
                  quantity != null ? () => widget.onSubmit(quantity!) : null,
              child: Text(widget.editMode ? "Update item" : "Add to cart"),
            ),
          )
        ],
      ),
    );
  }
}

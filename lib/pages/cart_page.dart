import 'package:blocpattern/helpers/bottom_sheet.dart';
import 'package:blocpattern/models/lineitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/cubits/cart_cubit.dart';
import 'package:blocpattern/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<LineItem>>(
      builder: (context, state) => ListView(
        children: state
            .map(
              (i) => ListTile(
                title: Text(i.productId),
                trailing: Text(i.quantity.toString()),
                onTap: () {
                  BottomSheetHelper.show(
                    context,
                    CartItem(
                      i.productId,
                      (quantity) {
                        i.quantity = quantity;
                        context.read<CartCubit>().refresh();
                        Navigator.pop(context);
                        var snackBar = SnackBar(
                            content: Text(
                                "Item ${i.productId} edited with quantity ${i.quantity}"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      quantity: i.quantity,
                      editMode: true,
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

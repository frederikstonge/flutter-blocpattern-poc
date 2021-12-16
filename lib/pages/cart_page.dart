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
                onTap: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      topEnd: Radius.circular(12),
                    ),
                  ),
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 50,
                        child: Divider(
                          thickness: 4,
                        ),
                      ),
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
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:blocpattern/helpers/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/cubits/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/widgets/cart_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Product"),
          trailing: const Icon(Icons.shopping_cart),
          onTap: () {
            var productCode = "sieq115";
            BottomSheetHelper.show(
              context,
              CartItem(
                productCode,
                (quantity) {
                  context.read<CartCubit>().addItem(productCode, quantity);
                  Navigator.pop(context);
                  var snackBar = SnackBar(
                      content: Text(
                          "Item $productCode added with quantity $quantity"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

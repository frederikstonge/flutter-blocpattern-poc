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
          title: const Text("product"),
          onTap: () => showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                topEnd: Radius.circular(12),
              ),
            ),
            context: context,
            builder: (context) {
              var productCode = "sieq115";
              return Column(
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
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/cart/cart.dart';
import 'package:state_management_bloc/blocs/cart/cart_event.dart';
import 'package:state_management_bloc/blocs/cart/cart_state.dart';
import 'package:state_management_bloc/blocs/catalog/catalog.dart';
import 'package:state_management_bloc/blocs/catalog/catalog_state.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: <Widget>[
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text(''),
                  key: Key('cart'),
                ),
              ),
              BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                List<int> cartItem = cartState.cartItem;
                return Positioned(
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Text(
                      '${cartItem.length}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      body: _body(),
    );
  }
}

Widget _body() {
  return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, catalogState) {
    List<String> catalog = catalogState.catalogItems;

    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: catalogState.catalogItems.length,
        itemBuilder: (context, index) => ProductTile(
          itemNo: index,
          catalogName: catalog,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
          childAspectRatio: 5,
        ),
      );
    });
  });
}

class ProductTile extends StatelessWidget {
  final int itemNo;
  final List<String> catalogName;

  const ProductTile({required this.itemNo, required this.catalogName});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        var cartItem = cartState.cartItem;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 30,
              child: Placeholder(
                color: color,
              ),
            ),
            title: Text(
              'Product ${catalogName[itemNo]}',
              key: Key('text_$itemNo'),
            ),
            trailing: IconButton(
              key: Key('icon_$itemNo'),
              icon: cartItem.contains(itemNo)
                  ? Icon(Icons.shopping_cart)
                  : Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                !cartItem.contains(itemNo)
                    ? context.read<CartBloc>().add(AddCart(itemNo))
                    : context.read<CartBloc>().add(RemoveCart(itemNo));
              },
            ),
          ),
        );
      },
    );
  }
}

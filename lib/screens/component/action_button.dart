import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/cart/cart.dart';
import 'package:state_management_bloc/blocs/cart/cart_event.dart';
import 'package:state_management_bloc/models/item.dart';

class ActionButton extends StatelessWidget {
  final ItemModel item;

  const ActionButton({required this.item}) : super();

  @override
  Widget build(BuildContext context) {
    var ctxCartBloc = context.read<CartBloc>();
    var isInCart = ctxCartBloc.items.contains(item);

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              ctxCartBloc.add(AddCart(item.id));
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return Colors.black;
        }),
      ),
      child: isInCart
          ? Icon(Icons.check, semanticLabel: 'ADDED')
          : Icon(Icons.shop, semanticLabel: 'ADD'),
    );
  }
}

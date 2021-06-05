import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/cart/cart_event.dart';
import 'package:state_management_bloc/blocs/cart/cart_state.dart';
import 'package:state_management_bloc/models/catalog.dart';
import 'package:state_management_bloc/models/item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<int> _cartItems = [];
  List<int> get getCartItems => _cartItems;
  CatalogModel _catalog = CatalogModel();
  CatalogModel get catalog => _catalog;

  CartBloc() : super(AddProductToCartState(cartItem: []));

  List<ItemModel> get items =>
      _cartItems.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddCart) {
      _cartItems.add(event.productIndex);
      yield AddProductToCartState(cartItem: _cartItems);
    } else if (event is RemoveCart) {
      _cartItems.remove(event.productIndex);
      yield RemoveProductToCartState(cartItem: _cartItems);
    }
  }
}

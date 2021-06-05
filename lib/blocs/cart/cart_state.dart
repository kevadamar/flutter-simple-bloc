abstract class CartState {
  final List<int> cartItem;
  const CartState(this.cartItem);

}

class AddProductToCartState extends CartState {
  final List<int> cartItem;

  const AddProductToCartState({required this.cartItem}) : super(cartItem);
}

class RemoveProductToCartState extends CartState {
  final List<int> cartItem;

  const RemoveProductToCartState({required this.cartItem}) : super(cartItem);
}

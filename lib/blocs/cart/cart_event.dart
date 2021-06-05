import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCart extends CartEvent {
  final int productIndex;

  const AddCart(this.productIndex);

}

class RemoveCart extends CartEvent {
  final int productIndex;

  const RemoveCart(this.productIndex);
}
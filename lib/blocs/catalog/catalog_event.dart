import 'package:equatable/equatable.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class GetAllCatalog implements CatalogEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}

import 'package:equatable/equatable.dart';

abstract class CatalogState extends Equatable {
  final List<String> catalogItems;
  const CatalogState(this.catalogItems);
}

class CatalogLoaded implements CatalogState {
  final List<String> catalogItems;

  const CatalogLoaded(this.catalogItems);

  @override
  // TODO: implement props
  List<Object?> get props => [catalogItems];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/catalog/catalog_event.dart';
import 'package:state_management_bloc/blocs/catalog/catalog_state.dart';
import 'package:state_management_bloc/models/catalog.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  List<String> _catalogItems = [];

  CatalogBloc() : super(CatalogLoaded(CatalogModel.itemNames));

  int get lengthCatalog => _catalogItems.length;
  get catalogitemsState => _catalogItems;

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is GetAllCatalog) {
      print("getall");
      yield CatalogLoaded(_catalogItems);
    }
    ;
  }
}

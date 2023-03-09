import 'package:bloc/bloc.dart';
import 'package:flutter_crud/utils/db_helper.dart';
import 'package:flutter_crud/utils/objectbox.dart';
import 'package:meta/meta.dart';

import '../../../models/item.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetItems>((event, emit) async {
      emit(SearchLoading());
      List<Item> items = await DBHelper.getItems(Objectbox.store_);
      emit(SearchLoaded(items: items));
    });

    on<SearchItem>((event, emit) async {
      emit(SearchLoading());
      List<Item> items = await DBHelper.getItems(Objectbox.store_);
      emit(SearchLoaded(
          items: event.keyword.isEmpty
              ? items
              : items
                  .where((e) =>
                      e.itemId
                          .toString()
                          .toLowerCase()
                          .contains(event.keyword.toLowerCase()) ||
                      e.itemName
                          .toLowerCase()
                          .contains(event.keyword.toLowerCase()) ||
                      e.barcode
                          .toLowerCase()
                          .contains(event.keyword.toLowerCase()))
                  .toList()));
    });
  }
}

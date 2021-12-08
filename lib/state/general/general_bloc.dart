import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thenex_webcatalog/model/category/category.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(const GeneralState()) {
    on<GeneralSetSearch>((event, emit) {
      emit(state.copyWith(currentSearch: event.search));
    });
    on<GeneralSetCategory>((event, emit) {
      emit(state.copyWith(currentlySelected: event.category));
    });
  }
}

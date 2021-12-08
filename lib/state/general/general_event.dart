part of 'general_bloc.dart';

abstract class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

class GeneralSetSearch extends GeneralEvent {
  final String search;
  const GeneralSetSearch({
    required this.search,
  });
}

class GeneralSetCategory extends GeneralEvent {
  final Category category;
  const GeneralSetCategory({
    required this.category,
  });
}

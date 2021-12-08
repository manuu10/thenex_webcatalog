part of 'general_bloc.dart';

class GeneralState extends Equatable {
  const GeneralState({
    this.currentlySelected = Category.constructEmpty,
    this.currentSearch = "",
  });

  final Category currentlySelected;
  final String currentSearch;

  @override
  List<Object> get props => [currentlySelected, currentSearch];

  GeneralState copyWith({
    Category? currentlySelected,
    String? currentSearch,
  }) {
    return GeneralState(
      currentlySelected: currentlySelected ?? this.currentlySelected,
      currentSearch: currentSearch ?? this.currentSearch,
    );
  }
}

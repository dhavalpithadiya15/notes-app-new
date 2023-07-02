import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int selectedColor;

  @override
  List<Object?> get props => [selectedColor];

  const HomeState({
     this.selectedColor=0,
  });

  HomeState copyWith({
    int? selectedColor,
  }) {
    return HomeState(
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

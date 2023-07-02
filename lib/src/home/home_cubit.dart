import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/src/home/home_state.dart';
import 'package:notes_app/src/home/home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> showColorFilterDialog(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const ColorFilterDialog();
      },
    );
  }

  void updateColorSelected(int index){
    emit(state.copyWith(selectedColor: index));
  }
}

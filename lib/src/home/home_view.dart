import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/src/constants/helper.dart';
import 'package:notes_app/src/home/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Notes"),
            actions: [
              IconButton(
                onPressed: () => BlocProvider.of<HomeCubit>(context).showColorFilterDialog(context),
                icon: const Icon(Icons.color_lens_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.grid_view_outlined),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text("Add note"),
            onPressed: () {},
          ),
        );
      }),
    );
  }
}

class ColorFilterDialog extends StatelessWidget {
  const ColorFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Filter by Color", style: TextStyle(fontSize: 18)),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
            ),
          )
        ],
      ),
      content: const ColorFilterDialogContent(),
    );
  }
}

class ColorFilterDialogContent extends StatelessWidget {
  const ColorFilterDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        return Wrap(
          children: List.generate(
            Helper.colorList.length,
            (index) {
              bool isSelected = context.select<HomeCubit, bool>((value) => value.state.selectedColor == index);
              return SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.16,
                child: Card(
                  elevation: 2,
                  color: Helper.colorList[index],
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context).updateColorSelected(index);
                      Navigator.pop(context);
                    },
                    child: isSelected ? const Icon(Icons.check) : null,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

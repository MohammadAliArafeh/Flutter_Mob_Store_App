import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/layout/cubit/cubit.dart';
import 'package:mob_store_app/layout/cubit/states.dart';
import 'package:mob_store_app/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is! HomeLoadingGetFavoritesState
            ? ListView.separated(
                itemBuilder: (context, index) => buildListProduct(
                    HomeCubit.get(context)
                        .favoritesModel!
                        .data!
                        .data![index]
                        .product,
                    context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount:
                    HomeCubit.get(context).favoritesModel!.data!.data!.length,
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

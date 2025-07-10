import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/cast_item.dart';

class CastList extends StatefulWidget {
  const CastList({super.key});

  @override
  State<CastList> createState() => _CastListState();
}

class _CastListState extends State<CastList> {
  @override
  void initState() {
    context.read<CastCubit>().fetchCast(id: context.read<AllFilmsModel>().id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 24),
                child: CastItem(castModel: state.casts[index]),
              ),
              itemCount: state.casts.length,
            ),
          );
        } else if (state is CastFailure) {
          return Center(child: Text(state.message));
        } else {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .06,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) => const CastItemShimmer(),
            ),
          );
        }
      },
    );
  }
}

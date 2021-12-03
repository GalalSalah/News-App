import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/new_app/cubit/cubit.dart';
import 'package:news_app/layout/new_app/cubit/state.dart';
import 'package:news_app/shared/component/components.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return
          list.isEmpty
              ? const Center(child: CircularProgressIndicator(

          ),)
              :
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return buildArticleItems(list[index],context);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[400],
                ),
              );
            },
            itemCount: list.length,
          );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/new_app/cubit/cubit.dart';
import 'package:news_app/layout/new_app/cubit/state.dart';
import 'package:news_app/shared/component/components.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value) {
                    if(value.isEmpty){
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                ),
              ),
              // SizedBox(height: 50,),
              Expanded(child: articleBuilder(list,context,isSearch:true)),
            ],
          ),
        );
      },
    );
  }
}
